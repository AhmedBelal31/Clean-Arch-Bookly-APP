import 'package:clean_arch_bookly_app/core/errors/failures.dart';
import 'package:clean_arch_bookly_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:clean_arch_bookly_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_arch_bookly_app/core/errors/failures.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  final HomeLocalDataSource homeLocalDataSource;

  Failure failure;

  HomeRepoImpl(
      {required this.homeRemoteDataSource,
      required this.homeLocalDataSource,
      required this.failure});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      var cachedBooks = homeLocalDataSource.fetchFeaturedBooks();
      if(cachedBooks.isNotEmpty)
        {
          return right(cachedBooks);
        }
      var books = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(books);
    } catch (error) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async{
    try {
      var cachedBooks = homeLocalDataSource.fetchNewestBooks();
      if(cachedBooks.isNotEmpty)
      {
        return right(cachedBooks);
      }
      var books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } catch (error) {
      return Left(failure);
    }
  }
  }
}
