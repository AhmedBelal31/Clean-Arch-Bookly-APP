import 'package:clean_arch_bookly_app/const.dart';
import 'package:clean_arch_bookly_app/features/search/presentation/controller/search_cubit/search_cubit.dart';
import 'package:clean_arch_bookly_app/features/search/presentation/views/widgets/Search_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/widgets/custom_error_message.dart';
import '../../../../../core/utils/widgets/custom_loading_indicator.dart';
import '../../../../home/domain/entities/book_entity.dart';
import '../../../../home/presentation/widgets/newest_books_list_view_item.dart';

class SearchBooksListView extends StatefulWidget {
  const SearchBooksListView({
    super.key,
    required this.searchedBooks,
    required this.searchQuery,

  });

  final List<BookEntity> searchedBooks;
  final String searchQuery;



  @override
  State<SearchBooksListView> createState() => _SearchBooksListViewState();
}

class _SearchBooksListViewState extends State<SearchBooksListView> {
  late final ScrollController _scrollController;
  bool isLoading = false;

  int pageNumber = 1;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() => listenToListState());
    super.initState();
  }

  void listenToListState() async {
    var currentPosition = _scrollController.position.pixels;
    var maxListLength = _scrollController.position.maxScrollExtent;

    if (currentPosition >= maxListLength * 0.7) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<SearchCubit>(context).fetchSearchedBooks(
            bookName: widget.searchQuery, pageNumber: pageNumber++);

        isLoading = false;
        debugPrint('page index is $pageNumber');
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
    return Expanded(
      child: ListView.separated(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => SearchedBooksListViewItem(
            index: index, searchedBooks: widget.searchedBooks[index]),
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: widget.searchedBooks.length,
      ),
    );
  }
}
