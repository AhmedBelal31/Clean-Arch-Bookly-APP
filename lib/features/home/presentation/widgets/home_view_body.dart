import 'package:flutter/material.dart';
import '../../../../core/utils/services/styles.dart';
import 'featured_books_bloc_builder.dart';
import 'newest_books_bloc_consumer.dart';
import 'custom_app_bar.dart';

class HomeVewBody extends StatelessWidget {
  const HomeVewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          FeaturedBooksBlocBuilder(),
          Padding(
            padding: EdgeInsets.only(top: 40, bottom: 0),
            child: Text(
              'Newest Books ',
              style: Styles.textStyle30,
            ),
          ),
          NewestBooksBlocConsumer(),
        ],
      ),
    );
  }
}
