import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../const.dart';
import '../../../../core/utils/service_locator.dart';
import '../../data/models/book_model.dart';
import '../../data/repos/home_repo_impl.dart';
import '../view_models/similar_books_cubit/similar_books_cubit.dart';
import '../widgets/book_details_view_body.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView(
      {Key? key, required this.bookModel, required this.index})
      : super(key: key);
  final BookModel bookModel;
  final int index;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    // BlocProvider.of<SimilarBookCubit>(context).fetchSimilarBooks(
    //   category: widget.bookModel.items[widget.index].volumeInfo.categories[0],
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => SimilarBookCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchSimilarBooks(
              category: 'computer',
            ),
          child: BookDetailsViewBody(
            bookModel: widget.bookModel,
            index: widget.index,
          ),
        ),
      ),
    );
  }
}
