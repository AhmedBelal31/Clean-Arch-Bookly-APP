import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/widgets/custom_cached_network_image.dart';
import '../../../../home/presentation/views/book_details_view.dart';
import '../../../../home/presentation/widgets/book_description.dart';

class SearchedBooksListViewItem extends StatelessWidget {
  final int index;
  BookEntity searchedBooks;

  SearchedBooksListViewItem(
      {super.key, required this.index, required this.searchedBooks});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                BookDetailsView(index: index, book: searchedBooks),
          ),
        );
      },
      child: SizedBox(
        height: 220,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: AspectRatio(
                  aspectRatio: 2.6 / 4,
                  child: CustomCachedNetworkImage(
                    imageUrl: searchedBooks.imageUrl ?? '',
                    errorImageAspectRatio: 2.6 / 4,
                  )),
            ),
            const SizedBox(width: 24),
            BookDescription(book: searchedBooks),
          ],
        ),
      ),
    );
  }
}
