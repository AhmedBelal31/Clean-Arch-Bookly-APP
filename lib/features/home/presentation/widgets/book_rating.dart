
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/services/styles.dart';


class BookRating extends StatelessWidget {
  const BookRating({Key? key, })
      : super(key: key);



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
            'io',
            style: Styles.textStyle18,
          ),
        const SizedBox(width: 8),
        Text(
          '2001/1/3',
          style: Styles.textStyle14.copyWith(color: const Color(0xff707070)),
        ),
      ],
    );
  }
}
