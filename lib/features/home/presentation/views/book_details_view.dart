import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/book_details_view_body.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView(
      {Key? key, required this.index})
      : super(key: key);

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
        body: BookDetailsViewBody(),
      ),
    );
  }
}
