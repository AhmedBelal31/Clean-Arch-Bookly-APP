import 'package:clean_arch_bookly_app/features/home/presentation/controller/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/book_entity.dart';
import 'newest_books_list_view_item.dart';

class NewestBooksListView extends StatefulWidget {
  NewestBooksListView({super.key, required this.newestBooks});

  List<BookEntity> newestBooks;

  @override
  State<NewestBooksListView> createState() => _NewestBooksListViewState();
}

class _NewestBooksListViewState extends State<NewestBooksListView> {
  late final ScrollController _scrollController;

  int nextPage = 0;
  bool isLoading = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      return listenToListState();
    });
    super.initState();
  }

  void listenToListState() async {
    var currentPosition = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPosition >= maxScrollLength * 0.7) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<NewestBooksCubit>(context)
            .fetchNewestBooks(pageNumber: nextPage++);

        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => NewestBooksListViewItem(
        index: index,
        newestBook: widget.newestBooks[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: widget.newestBooks.length,
    );

    // return ListView.separated(
    //   controller: _scrollController,
    //   physics: const BouncingScrollPhysics(),
    //   shrinkWrap: true,
    //   itemBuilder: (context, index) => NewestBooksListViewItem(
    //     index: index,
    //     newestBook: widget.newestBooks[index],
    //   ),
    //   separatorBuilder: (context, index) => const SizedBox(height: 20),
    //   itemCount: widget.newestBooks.length,
    // );
  }
}
