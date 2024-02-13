import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/widgets/custom_error_message.dart';
import '../../../../core/utils/widgets/custom_loading_indicator.dart';
import '../../domain/entities/book_entity.dart';
import '../controller/featured_books_cubit/featured_books_cubit.dart';
import '../controller/featured_books_cubit/featured_books_states.dart';
import 'featured_books_list_view.dart';

class FeaturedBooksBlocBuilder extends StatefulWidget {
  const FeaturedBooksBlocBuilder({
    super.key,
  });

  @override
  State<FeaturedBooksBlocBuilder> createState() =>
      _FeaturedBooksBlocBuilderState();
}

class _FeaturedBooksBlocBuilderState extends State<FeaturedBooksBlocBuilder> {
  List<BookEntity> allBooks = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksStates>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccessState) {
          allBooks.addAll(state.books);
        }

        if (state is FeaturedBooksPaginationFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: CustomErrorMessage(
                errorMessage: 'Error ${state.error}',
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccessState ||
            state is FeaturedBooksPaginationLoadingState ||
            state is FeaturedBooksPaginationFailureState) {
          return FeaturedBooksListView(
            books: allBooks,
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
