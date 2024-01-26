class BookEntity {
  String bookId;
  String imageUrl;

  String title;

  String authorName;

  num price;

  num rating;

  BookEntity({
    required this.bookId,
    required this.imageUrl,
    required this.title,
    required this.authorName,
    required this.price,
    required this.rating,
  });
}
