import 'package:flutter/material.dart';
import '../../../../const.dart';
import '../../../../core/utils/functions/lanuchCustomUrl.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/utils/widgets/custom_cached_network_image.dart';
import '../../data/models/book_model.dart';
import 'book_rating.dart';
import 'custom_button.dart';

class BookPreview extends StatelessWidget {
  const BookPreview({
    super.key,
    required this.width,
    required this.index,
    required this.bookModel,
  });

  final double width;
  final int index;
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.22, vertical: 20),
          child: AspectRatio(
            aspectRatio: 2.6 / 4,
            child: Container(
                decoration: BoxDecoration(
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(16.0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: CustomCachedNetworkImage(
                      imageUrl: bookModel
                              .items[index].volumeInfo.imageLinks.thumbnail ??
                          '',
                      errorImageAspectRatio: 2.5 / 4),
                )),
          ),
        ),
        const SizedBox(height: 30),
        Text(
          bookModel.items[index].volumeInfo.title ?? 'The Jungle Book ',
          style: Styles.textStyle30.copyWith(fontFamily: kGtSectraFine),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        const SizedBox(height: 10),
        Opacity(
          opacity: 0.8,
          child: Text(
            '${bookModel.items[index].volumeInfo.authors.isNotEmpty ? bookModel.items[index].volumeInfo.authors[0] : 'Jk Rowing'} ',
            style: Styles.textStyle18,
          ),
        ),
        const SizedBox(height: 20),
        BookRating(index: index, bookModel: bookModel),
        if (bookModel.items[index].volumeInfo.previewLink != null)
          const SizedBox(height: 40),
        Row(
          children: [
            //SizedBox(width: 10),
            CustomButton(
              onPressed: () {},
              backgroundColor: Colors.white,
              textColor: Colors.black,
              text:
                  '${bookModel.items[index].saleInfo!.listPrice!.amount ?? '19,99'} €',
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                bottomLeft: Radius.circular(16.0),
              ),
            ),
            CustomButton(
              onPressed: () {
                return launchCustomUrl(
                  context,
                  bookModel.items[index].volumeInfo.previewLink!,
                );
              },
              backgroundColor: Colors.red,
              textColor: Colors.white,
              text: 'Free Preview',
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
            ),
            //SizedBox(width: 10),
          ],
        ),
      ],
    );
  }
}
