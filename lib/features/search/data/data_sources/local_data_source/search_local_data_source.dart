import 'package:clean_arch_bookly_app/const.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../home/domain/entities/book_entity.dart';

abstract class SearchLocalDataSource {
  List<BookEntity> fetchSearchedBooks({required String bookName, int pageNumber = 0});
}

class SearchLocalDataSourceImpl extends SearchLocalDataSource {
  @override
  List<BookEntity> fetchSearchedBooks({required String bookName, int pageNumber = 0}) {
    var box = Hive.box<BookEntity>(kSearchBox);

    var startIndex = pageNumber * 10;
    var endIndex = (pageNumber + 1) * 10;
    int booksListLength = box.values.length;
    if (startIndex >= booksListLength || endIndex > booksListLength) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
}
