import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../models/book_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, BookModel>> fetchFeaturedBooks();

  Future<Either<Failure, BookModel>> fetchNewestBooks();

  Future<Either<Failure, BookModel>> fetchSimilartBooks(
      {required String category});
}
