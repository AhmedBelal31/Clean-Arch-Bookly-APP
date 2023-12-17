import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/widgets/custom_cached_network_image.dart';
import '../../data/models/book_model.dart';
import '../views/book_details_view.dart';

class FeaturedBooksListViewItem extends StatelessWidget {
  final BookModel bookModel;
  final int index;

  //final String imageUrl;

  const FeaturedBooksListViewItem(
      {Key? key, required this.bookModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              BookDetailsView(bookModel: bookModel, index: index),
        ));
        //GoRouter.of(context).push(AppRouter.kBookDetailsView);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: AspectRatio(
            aspectRatio: 2.7 / 4,
            child: CustomCachedNetworkImage(
                imageUrl:
                    bookModel.items[index].volumeInfo.imageLinks.thumbnail ??
                        '',
                errorImageAspectRatio: 2.7 / 4),
          ),
        ),
      ),
    );
  }
}
