import 'package:clean_arch_bookly_app/core/errors/failures.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookEntity>>> fetchSearchedBooks({required String bookName, int pageNumber = 0});
}
