import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/widgets/custom_error_message.dart';
import '../../../../core/utils/widgets/custom_loading_indicator.dart';
import '../view_models/newest_books_cubit/newest_books_cubit.dart';
import '../view_models/newest_books_cubit/newest_books_states.dart';
import 'newest_books_list_view_item.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBookCubit, NewestBookStates>(
      builder: (context, state) {
        if (state is NewestBooksSuccessState) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => NewestBooksListViewItem(
              index: index,
              bookModel: state.bookModel,
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: state.bookModel.items.length,
          );
        } else if (state is NewestBooksErrorState) {
          return CustomErrorMessage(
            errorMessage: state.error,
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
