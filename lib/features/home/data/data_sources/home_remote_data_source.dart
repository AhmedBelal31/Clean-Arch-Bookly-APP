import 'package:clean_arch_bookly_app/const.dart';
import 'package:clean_arch_bookly_app/core/utils/services/api_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/utils/functions/save_books_data.dart';
import '../../domain/entities/book_entity.dart';
import '../models/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();

  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    final data = await apiService.getData(
        endPoint: 'volumes?q=programming&filter=free-ebooks');
    print('Data IS ${data.values}');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(kFeaturedBox, books);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    final data = await apiService.getData(
        endPoint: 'volumes?q=programming&orderBy=newest&filter=free-ebooks');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(kNewestBox, books);

    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
