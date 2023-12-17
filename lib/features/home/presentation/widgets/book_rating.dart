
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/styles.dart';
import '../../data/models/book_model.dart';

class BookRating extends StatelessWidget {
  const BookRating({Key? key, required this.index, required this.bookModel})
      : super(key: key);
  final int index;

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (bookModel.items[index].volumeInfo.ratingsCount != null)
          const Icon(
            FontAwesomeIcons.solidStar,
            color: Color(0xffFFDD4F),
            size: 16,
          ),
        const SizedBox(width: 10),
        if (bookModel.items[index].volumeInfo.ratingsCount != null)
          Text(
            '${bookModel.items[index].volumeInfo.ratingsCount}',
            style: Styles.textStyle18,
          ),
        const SizedBox(width: 8),
        Text(
          bookModel.items[index].volumeInfo.publishedDate ?? '2001/1/3',
          style: Styles.textStyle14.copyWith(color: const Color(0xff707070)),
        ),
      ],
    );
  }
}
