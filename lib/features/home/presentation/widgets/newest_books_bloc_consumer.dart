import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/widgets/custom_error_message.dart';
import '../../../../core/utils/widgets/custom_loading_indicator.dart';
import '../../domain/entities/book_entity.dart';
import '../controller/newest_books_cubit/newest_books_cubit.dart';
import '../controller/newest_books_cubit/newest_books_states.dart';
import 'newest_books_list_view.dart';

class NewestBooksBlocConsumer extends StatefulWidget {
  const NewestBooksBlocConsumer({
    super.key,
  });

  @override
  State<NewestBooksBlocConsumer> createState() =>
      _NewestBooksBlocConsumerState();
}

class _NewestBooksBlocConsumerState extends State<NewestBooksBlocConsumer> {
  List<BookEntity> allBooks = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksStates>(
      listener: (context, state) {
        if (state is NewestBooksSuccessState) {
          allBooks.addAll(state.books);
        }
        if (state is NewestBooksPaginationFailureState) {
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
        if (state is NewestBooksSuccessState ||
            state is NewestBooksPaginationLoadingState ||
            state is NewestBooksFailureState) {
          return NewestBooksListView(newestBooks: allBooks);
        } else if (state is NewestBooksFailureState) {
          return CustomErrorMessage(errorMessage: state.error);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
