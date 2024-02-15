import 'package:clean_arch_bookly_app/const.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../home/domain/entities/book_entity.dart';

abstract class SearchLocalDataSource {
  List<BookEntity> fetchSearchedBooks(
      {required String bookName, int pageNumber = 0});
}

class SearchLocalDataSourceImpl extends SearchLocalDataSource {
  @override
  List<BookEntity> fetchSearchedBooks(
      {required String bookName, int pageNumber = 0}) {
    var box = Hive.box<BookEntity>(kSearchBox);

    List<BookEntity> books = box.values.toList();
    return books;
  }
}
