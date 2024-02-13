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
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0}) async {
    try {
      List<BookEntity> cachedBooks = homeLocalDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
      if (cachedBooks.isNotEmpty) {
        return right(cachedBooks);
      }
      List<BookEntity> books =
          await homeRemoteDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
      return right(books);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks(
      {int pageNumber = 0}) async {
    try {
      // List<BookEntity> cachedBooks;
      List<BookEntity> cachedBooks = homeLocalDataSource.fetchNewestBooks(pageNumber: pageNumber);
      if (cachedBooks.isNotEmpty) {
        return right(cachedBooks);
      }
      List<BookEntity> books =
          await homeRemoteDataSource.fetchNewestBooks(pageNumber: pageNumber);
      return right(books);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }
}
