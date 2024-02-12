import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/widgets/custom_error_message.dart';
import '../../../../core/utils/widgets/custom_loading_indicator.dart';
import 'similar_books_list_view_item.dart';

class SimilarBooksListView extends StatelessWidget {


  const SimilarBooksListView({super.key,required this.books});
final List<BookEntity> books ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: MediaQuery.of(context).size *.15,
      height: 160,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>  SimilarBooksListViewItem(imageUrl: books[index].imageUrl),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: 6,
      ),
    );
  }
}
