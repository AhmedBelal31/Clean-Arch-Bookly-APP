import 'package:hive_flutter/hive_flutter.dart';

import '../../../features/home/domain/entities/book_entity.dart';

void saveBooksData(String booksName ,List<BookEntity> books )
{
  var hiveBox = Hive.box(booksName);
  hiveBox.addAll(books);
}