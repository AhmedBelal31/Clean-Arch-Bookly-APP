import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/widgets/custom_cached_network_image.dart';
import '../../data/models/book_model.dart';
import '../views/book_details_view.dart';
import 'book_description.dart';

class NewestBooksListViewItem extends StatelessWidget {
  final BookModel bookModel;
  final int index;

  const NewestBooksListViewItem(
      {Key? key, required this.bookModel, required this.index})
      : super(key: key);

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
          builder: (context) =>
              BookDetailsView(bookModel: bookModel, index: index),
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
                    imageUrl: bookModel
                            .items[index].volumeInfo.imageLinks.thumbnail ??
                        '',
                    errorImageAspectRatio: 2.6 / 4,
                  )),
            ),
            const SizedBox(width: 24),
            BookDescription(
              index: index,
              bookModel: bookModel,
            )
          ],
        ),
      ),
    );
  }
}
