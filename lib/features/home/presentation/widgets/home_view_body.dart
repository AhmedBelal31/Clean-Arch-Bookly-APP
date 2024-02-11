import 'package:flutter/material.dart';
import '../../../../core/utils/services/styles.dart';
import 'newest_books_list_view.dart';
import 'custom_app_bar.dart';
import 'featured_books_list_view.dart';

class HomeVewBody extends StatefulWidget {
  const HomeVewBody({
    super.key,
  });

  @override
  State<HomeVewBody> createState() => _HomeVewBodyState();
}

class _HomeVewBodyState extends State<HomeVewBody> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          FeaturedBooksListView(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 0),
                  child: Text(
                    'Best Seller ',
                    style: Styles.textStyle30,
                  ),
                ),
                NewestBooksListView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
