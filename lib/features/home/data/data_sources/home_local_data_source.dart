import '../../../../const.dart';
import '../../domain/entities/book_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});

  List<BookEntity> fetchNewestBooks({int pageNumber = 0});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    var box = Hive.box<BookEntity>(kFeaturedBox);
    var startIndex = pageNumber * 10;
    var endIndex = (pageNumber + 1) * 10;
    int booksListLength = box.values.length;
    if (startIndex >= booksListLength || endIndex > booksListLength) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks({int pageNumber = 0}) {
    var box = Hive.box<BookEntity>(kNewestBox);
    var startIndex = pageNumber * 10;
    var endIndex = (pageNumber + 1) * 10;
    int booksListLength = box.values.length;
    if (startIndex >= booksListLength || endIndex > booksListLength) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
}
