import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/widgets/custom_error_message.dart';
import '../../../../../core/utils/widgets/custom_loading_indicator.dart';
import '../../../../home/presentation/widgets/newest_books_list_view_item.dart';


class SearchItemsListView extends StatelessWidget {
  const SearchItemsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) =>
          NewestBooksListViewItem(index: 2,),
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: 8,
    );
  }
}
