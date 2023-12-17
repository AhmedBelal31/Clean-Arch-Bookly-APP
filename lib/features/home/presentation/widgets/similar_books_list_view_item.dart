import 'package:flutter/material.dart';
import '../../../../core/utils/widgets/custom_cached_network_image.dart';

class SimilarBooksListViewItem extends StatelessWidget {
  const SimilarBooksListViewItem({Key? key, required this.imageUrl})
      : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: AspectRatio(
            aspectRatio: 2.7 / 4,
            child: CustomCachedNetworkImage(
                imageUrl: imageUrl, errorImageAspectRatio: 2.7 / 4),
          ),
        ),
      ),
    );
  }
}
