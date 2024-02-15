import '../../../features/home/data/models/book_model.dart';
import '../../../features/home/domain/entities/book_entity.dart';

List<BookEntity> getBooksList(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  for (var bookMap in data['items']) {
    books.add(BookModel.fromJson(bookMap));
  }
  return books;
}