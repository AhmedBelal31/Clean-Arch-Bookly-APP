import 'package:clean_arch_bookly_app/const.dart';
import 'package:clean_arch_bookly_app/core/utils/services/api_service.dart';
import 'package:clean_arch_bookly_app/core/utils/widgets/custom_error_message.dart';
import 'package:clean_arch_bookly_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/search/data/data_sources/local_data_source/search_local_data_source.dart';
import 'package:clean_arch_bookly_app/features/search/data/data_sources/search_remote_data_source/search_remote_data_source.dart';
import 'package:clean_arch_bookly_app/features/search/data/repos/search_repo_impl.dart';
import 'package:clean_arch_bookly_app/features/search/domain/use_cases/search_use_case.dart';
import 'package:clean_arch_bookly_app/features/search/presentation/controller/search_cubit/search_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../controller/search_cubit/search_states.dart';
import 'custom_text_field.dart';
import 'search_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    // List<BookEntity> allSearchedBooks = [];
    List<BookEntity> searchedBooks = [];
    String searchQuery = '';
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            TextFormField(
              controller: searchController,
              onChanged: (query) async {
                await BlocProvider.of<SearchCubit>(context)
                    .fetchSearchedBooks(bookName: query);
                searchQuery = query;
                print('searchQuery is $searchQuery');
              },
              style: const TextStyle(letterSpacing: 1.8),
              decoration: InputDecoration(
                enabledBorder: buildOutlineInputBorder(),
                focusedBorder: buildOutlineInputBorder(),
                hintText: 'Search ',
                suffixIcon: const Opacity(
                  opacity: 0.8,
                  child: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                  ),
                ),
                hintStyle: const TextStyle(
                  letterSpacing: 2.0,
                ),
              ),
            ),
            const SizedBox(height: 30),
            BlocConsumer<SearchCubit, SearchStates>(
              listener: (context, state) {
                if (state is SearchedBooksSuccessState) {
                  // allSearchedBooks.addAll(state.searchedBooks);
                  searchedBooks = state.searchedBooks;
                }
                if (state is SearchedBooksPaginationFailureState) {
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
                if (state is SearchedBooksSuccessState ||
                    state is SearchedBooksPaginationFailureState) {
                  return SearchBooksListView(
                    searchedBooks: state is SearchedBooksSuccessState ? state.searchedBooks : [],
                    searchQuery: searchQuery,
                  );
                } else if (state is SearchedBooksFailureState) {
                  return CustomErrorMessage(errorMessage: state.error);
                } else {
                  return const CustomLoadingIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(12.0),
    );
  }
}
