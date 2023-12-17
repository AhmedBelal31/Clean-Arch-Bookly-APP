import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/widgets/custom_error_message.dart';
import '../../../../core/utils/widgets/custom_loading_indicator.dart';
import '../view_models/featured_books_cubit/featured_books_cubit.dart';
import '../view_models/featured_books_cubit/featured_books_states.dart';
import 'featured_books_list_view_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit, FeaturedBookStates>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => FeaturedBooksListViewItem(
                bookModel: state.bookModel,
                index: index,
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 5),
              itemCount: state.bookModel.items.length,
            ),
          );
        } else if (state is FeaturedBooksErrorState) {
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
