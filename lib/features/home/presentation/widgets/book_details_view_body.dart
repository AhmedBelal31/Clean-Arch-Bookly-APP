import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/controller/newest_books_cubit/newest_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/controller/newest_books_cubit/newest_books_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/services/styles.dart';

import 'book_preview.dart';
import 'similar_books_list_view.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.shopping_cart_outlined,
                  size: 30,
                ),
              ],
            ),
            BookPreview(width: width, book: book),
            const SizedBox(height: 60),
            const Text(
              'You Can Also Like ',
              style: Styles.textStyle18,
            ),
            const SizedBox(height: 20),
            BlocBuilder<NewestBooksCubit, NewestBooksStates>(
              builder: (context, state) {
                if (state is NewestBooksSuccessState) {
                  return SimilarBooksListView(books: state.books);
                } else {
                  return const Text('No Data ');
                }
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
