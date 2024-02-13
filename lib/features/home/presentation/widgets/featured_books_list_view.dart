import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/controller/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'featured_books_list_view_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  late final ScrollController _scrollController;

  int nextPage = 1;
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
        await BlocProvider.of<FeaturedBooksCubit>(context)
            .fetchFeaturedBooks(pageNumber: nextPage);
        nextPage++;
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
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.separated(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => FeaturedBooksListViewItem(
          index: index,
          book: widget.books[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 5),
        itemCount: widget.books.length,
      ),
    );
  }
}
