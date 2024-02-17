import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import '../../../../core/utils/widgets/custom_cached_network_image.dart';
import '../views/book_details_view.dart';
import 'book_description.dart';

class NewestBooksListViewItem extends StatelessWidget {
  final int index;
  BookEntity newestBook;

  NewestBooksListViewItem(
      {super.key, required this.index, required this.newestBook});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // GoRouter.of(context).pushNamed(AppRouter.kBookDetailsView ,
        //   extra: bookModel ,
        //   pathParameters: {
        //   'index' : index.toString()
        //   }
        //
        // );

        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BookDetailsView(index: index , book: newestBook),
        ));
      },
      child: SizedBox(
        height: 180,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: AspectRatio(
                  aspectRatio: 2.6 / 4,
                  child: CustomCachedNetworkImage(
                    imageUrl: newestBook.imageUrl ?? '',
                    errorImageAspectRatio: 2.6 / 4,
                  )),
            ),
            const SizedBox(width: 24),
            BookDescription(book: newestBook),
          ],
        ),
      ),
    );
  }
}
