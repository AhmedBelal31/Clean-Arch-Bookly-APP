import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/widgets/custom_error_message.dart';
import '../../../../core/utils/widgets/custom_loading_indicator.dart';
import '../controller/featured_books_cubit/featured_books_cubit.dart';
import '../controller/featured_books_cubit/featured_books_states.dart';
import 'featured_books_list_view.dart';

class FeaturedBooksBlocBuilder extends StatelessWidget {
  const FeaturedBooksBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksStates>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccessState) {
          return FeaturedBooksListView(
            books: state.books,
          );
        } else if (state is FeaturedBooksFailureState) {
          return CustomErrorMessage(errorMessage: state.error);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
