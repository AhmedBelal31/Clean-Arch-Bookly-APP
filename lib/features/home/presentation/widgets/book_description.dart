import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import '../../../../const.dart';
import '../../../../core/utils/services/styles.dart';

import 'book_rating.dart';

class BookDescription extends StatelessWidget {
  const BookDescription({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            child: Text(book.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle20.copyWith(
                  fontFamily: kGtSectraFine,
                )),
          ),
          const SizedBox(height: 8),
          Opacity(
              opacity: 0.9,
              child: Text(
                book.authorName,
                style: Styles.textStyle14,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: Text(
                  book.price == 0
                      ? 'Free , ${book.price.toString()}\$ '
                      : ' ${book.price.toString()} \$ ',
                  style:
                      Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              BookRating(book: book),
            ],
          ),
        ],
      ),
    );
  }
}
