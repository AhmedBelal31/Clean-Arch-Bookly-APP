import 'package:flutter/material.dart';
import '../../../../const.dart';
import '../../../../core/utils/styles.dart';
import '../../data/models/book_model.dart';
import 'book_rating.dart';

class BookDescription extends StatelessWidget {
  final int index;

  final BookModel bookModel;

  const BookDescription(
      {super.key, required this.index, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            child: Text(bookModel.items[index].volumeInfo.title!,
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
                '${bookModel.items[index].volumeInfo.authors.isNotEmpty ? bookModel.items[index].volumeInfo.authors[0] : 'Jk Rowing'} ',
                style: Styles.textStyle14,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: Text(
                  '${bookModel.items[index].saleInfo!.listPrice!.amount ?? '19,99'} €',
                  style:
                      Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              BookRating(
                index: index,
                bookModel: bookModel,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
