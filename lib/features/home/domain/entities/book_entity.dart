import 'package:hive/hive.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  String bookId;
  @HiveField(1)
  String imageUrl;
  @HiveField(2)
  String title;
  @HiveField(3)
  String authorName;
  @HiveField(4)
  num price;
  @HiveField(5)
  num rating;
  @HiveField(6)
  String previewLink;
  @HiveField(7)
  String publishedDate;

  BookEntity({
    required this.bookId,
    required this.imageUrl,
    required this.title,
    required this.authorName,
    required this.price,
    required this.rating,
    required this.previewLink,
    required this.publishedDate,
  });
}
