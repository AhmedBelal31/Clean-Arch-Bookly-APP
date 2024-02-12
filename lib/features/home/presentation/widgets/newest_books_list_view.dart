import 'package:flutter/material.dart';
import '../../domain/entities/book_entity.dart';
import 'newest_books_list_view_item.dart';

class NewestBooksListView extends StatelessWidget {
  NewestBooksListView({super.key, required this.newestBooks});

  List<BookEntity> newestBooks;


  @override
  Widget build(BuildContext context) {
    print('Newest Test ${newestBooks[0].imageUrl}');
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => NewestBooksListViewItem(
        index: index,
        newestBook: newestBooks[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount:newestBooks.length,
    );
  }
}
