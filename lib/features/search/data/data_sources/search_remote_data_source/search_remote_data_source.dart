import 'package:clean_arch_bookly_app/core/utils/services/api_service.dart';
import 'package:clean_arch_bookly_app/features/search/domain/use_cases/search_use_case.dart';
import '../../../../../const.dart';
import '../../../../../core/utils/functions/get_books_list.dart';
import '../../../../../core/utils/functions/save_books_data.dart';
import '../../../../home/domain/entities/book_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> fetchSearchedBooks(
      {required String bookName, int pageNumber = 0});
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<BookEntity>> fetchSearchedBooks(
      {required String bookName, int pageNumber = 0}) async {
    final searchedBooks = await apiService.getData(
        endPoint: 'volumes?q=$bookName&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(searchedBooks);
    saveBooksData(kSearchBox, books);

    return books;
  }
}
