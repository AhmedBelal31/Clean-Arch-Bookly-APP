import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/widgets/custom_error_message.dart';
import '../../../../core/utils/widgets/custom_loading_indicator.dart';
import 'similar_books_list_view_item.dart';

class SimilarBooksListView extends StatelessWidget {


  const SimilarBooksListView({Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: MediaQuery.of(context).size *.15,
      height: 160,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => SimilarBooksListViewItem(imageUrl: ''),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: 6,
      ),
    );
  }
}
