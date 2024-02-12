
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/services/styles.dart';


class BookRating extends StatelessWidget {
  const BookRating({super.key,required this.book });

final BookEntity book  ;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

          const Icon(
            FontAwesomeIcons.solidStar,
            color: Color(0xffFFDD4F),
            size: 16,
          ),
        const SizedBox(width: 10),

          Text(
            '${book.rating}',
            style: Styles.textStyle18,
          ),
        const SizedBox(width: 8),
        Text(
         book.publishedDate,
          style: Styles.textStyle14.copyWith(color: const Color(0xff707070)),
        ),
      ],
    );
  }
}
