import 'package:clean_arch_bookly_app/const.dart';
import 'package:clean_arch_bookly_app/core/utils/services/api_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/utils/functions/get_books_list.dart';
import '../../../../core/utils/functions/save_books_data.dart';
import '../../domain/entities/book_entity.dart';
import '../models/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});

  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});

  // 'volumes?q=programming&filter=free-ebooks&maxResults=20'
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    final data = await apiService.getData(
        endPoint: 'volumes?q=programming&startIndex=${pageNumber*10}');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(kFeaturedBox, books);
    return books;
  }

  // 'volumes?q=programming&orderBy=newest&filter=free-ebooks&maxResults=40&startIndex=10'
  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    final data = await apiService.getData(
        endPoint: 'volumes?q=programming&orderBy=newest&${pageNumber*10}');

    List<BookEntity> books = getBooksList(data);
    saveBooksData(kNewestBox, books);
    return books;
  }


}
