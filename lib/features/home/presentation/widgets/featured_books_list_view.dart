import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/widgets/custom_error_message.dart';
import '../../../../core/utils/widgets/custom_loading_indicator.dart';
import 'featured_books_list_view_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => FeaturedBooksListViewItem(
          index: index,
          book: books[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 5),
        itemCount: 5,
      ),
    );
  }
}
