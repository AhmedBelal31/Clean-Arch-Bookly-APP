import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/widgets/custom_error_message.dart';
import '../../../../../core/utils/widgets/custom_loading_indicator.dart';
import '../../../../home/presentation/widgets/newest_books_list_view_item.dart';
import '../../view_models/search_cubit/search_cubit.dart';
import '../../view_models/search_cubit/search_states.dart';

class SearchItemsListView extends StatelessWidget {
  const SearchItemsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        if (state is SearchSuccessState) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                NewestBooksListViewItem(index: 2, bookModel: state.bookModel),
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: 8,
          );
        } else if (state is SearchErrorState) {
          return CustomErrorMessage(errorMessage: state.error);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
