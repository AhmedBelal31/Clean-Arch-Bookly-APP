import 'package:flutter/material.dart';
import 'custom_text_field.dart';
import 'search_item_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            CustomTextField(),
            SizedBox(height: 30),
            Expanded(
              child: SearchItemsListView(),
            ),
          ],
        ),
      ),
    );
  }
}
