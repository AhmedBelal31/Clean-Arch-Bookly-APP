import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/widgets/custom_cached_network_image.dart';
import '../views/book_details_view.dart';
import 'book_description.dart';

class NewestBooksListViewItem extends StatelessWidget {
  final int index;

  const NewestBooksListViewItem(
      {Key? key, required this.index})
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
        Navigator.of(context).push(
            MaterialPageRoute(
          builder: (context) =>
              BookDetailsView(index: index),
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
                    imageUrl:
                    '',
                    errorImageAspectRatio: 2.6 / 4,
                  )),
            ),
            const SizedBox(width: 24),
            BookDescription()
          ],
        ),
      ),
    );
  }
}
