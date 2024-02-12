import 'package:clean_arch_bookly_app/core/errors/failures.dart';
import 'package:clean_arch_bookly_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:clean_arch_bookly_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      // List<BookEntity> cachedBooks = homeLocalDataSource.fetchFeaturedBooks();
      // if (cachedBooks.isNotEmpty) {
      //   return right(cachedBooks);
      // }
      List<BookEntity> books = await homeRemoteDataSource.fetchFeaturedBooks();
      print('Home Repo Impl fetchFeaturedBooks  ${books[0].imageUrl}');
      return right(books);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
     // List<BookEntity> cachedBooks;
      // List<BookEntity>  cachedBooks = homeLocalDataSource.fetchNewestBooks();
      // if (cachedBooks.isNotEmpty) {
      //   return right(cachedBooks);
      // }
      List<BookEntity> books = await homeRemoteDataSource.fetchNewestBooks();
      print('Home Repo Impl ${books[0].imageUrl}');
      return right(books);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }
}
