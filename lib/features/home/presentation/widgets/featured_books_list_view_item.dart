import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/services/app_router.dart';
import '../../../../core/utils/widgets/custom_cached_network_image.dart';

import '../views/book_details_view.dart';

class FeaturedBooksListViewItem extends StatelessWidget {

  final int index;

  //final String imageUrl;

  const FeaturedBooksListViewItem(
      {super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              BookDetailsView( index: index),
        ));
        //GoRouter.of(context).push(AppRouter.kBookDetailsView);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: const AspectRatio(
            aspectRatio: 2.7 / 4,
            child: CustomCachedNetworkImage(
                imageUrl: '',
                errorImageAspectRatio: 2.7 / 4),
          ),
        ),
      ),
    );
  }
}
