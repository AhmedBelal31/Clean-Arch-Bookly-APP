import 'package:flutter/material.dart';
import '../../../../core/utils/styles.dart';

import 'book_preview.dart';
import 'similar_books_list_view.dart';

class BookDetailsViewBody extends StatelessWidget {



  const BookDetailsViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.shopping_cart_outlined,
                  size: 30,
                ),
              ],
            ),
            BookPreview(width: width,),
            const SizedBox(height: 60),
            const Text(
              'You Can Also Like ',
              style: Styles.textStyle18,
            ),
            const SizedBox(height: 20),
            SimilarBooksListView(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
