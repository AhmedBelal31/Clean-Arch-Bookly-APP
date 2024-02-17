import 'package:clean_arch_bookly_app/core/errors/failures.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/search/data/data_sources/local_data_source/search_local_data_source.dart';
import 'package:clean_arch_bookly_app/features/search/data/data_sources/search_remote_data_source/search_remote_data_source.dart';
import 'package:clean_arch_bookly_app/features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;

  final SearchLocalDataSource searchLocalDataSource;

  SearchRepoImpl(
      {required this.searchRemoteDataSource,
      required this.searchLocalDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSearchedBooks(
      { required String bookName, int pageNumber = 0}) async {
    try {
      List<BookEntity> cachedBooks = searchLocalDataSource.fetchSearchedBooks(
          bookName: bookName, pageNumber: pageNumber);

      // if (cachedBooks.isNotEmpty) {
      //   return right(cachedBooks);
      // } else {
      //   List<BookEntity> searchedBooks = await searchRemoteDataSource
      //       .fetchSearchedBooks(bookName: bookName, pageNumber: pageNumber);
      //   return right(searchedBooks);
      // }

      List<BookEntity> searchedBooks = await searchRemoteDataSource
          .fetchSearchedBooks(bookName: bookName, pageNumber: pageNumber);
      return right(searchedBooks);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioException(error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
