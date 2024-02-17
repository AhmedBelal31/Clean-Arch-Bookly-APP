import 'package:clean_arch_bookly_app/core/errors/failures.dart';
import 'package:clean_arch_bookly_app/core/use_case/use_case.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';

abstract class SearchUseCase<Type, Param, Param2> {
  Future<Either<Failure, Type>> execute({Param param,  required Param2 param2});
}

class FetchSearchedBooksUseCase extends SearchUseCase<List<BookEntity>, int, String> {
  SearchRepo searchRepo;

  FetchSearchedBooksUseCase({required this.searchRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> execute({int param = 0, required  String param2}) async {
    return await searchRepo.fetchSearchedBooks(
        bookName: param2, pageNumber: param);
  }
}
