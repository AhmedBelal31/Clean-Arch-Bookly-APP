import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/widgets/custom_error_message.dart';
import '../../../../core/utils/widgets/custom_loading_indicator.dart';
import '../../data/models/book_model.dart';
import '../view_models/similar_books_cubit/similar_books_cubit.dart';
import '../view_models/similar_books_cubit/similar_books_states.dart';
import 'similar_books_list_view_item.dart';

class SimilarBooksListView extends StatelessWidget {
  final BookModel bookModel;

  const SimilarBooksListView({Key? key, required this.bookModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBookCubit, SimilarBookStates>(
      builder: (context, state) {
        if (state is SimilarBooksSuccessState) {
          //print('index is ${bookModel.items}');
          return SizedBox(
            //height: MediaQuery.of(context).size *.15,
            height: 160,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => SimilarBooksListViewItem(
                  imageUrl: state.bookModel.items[index].volumeInfo.imageLinks
                          .thumbnail ??
                      ''),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: state.bookModel.items.length,
            ),
          );
        } else if (state is SimilarBooksErrorState) {
          return CustomErrorMessage(errorMessage: state.error);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
