import 'package:clean_arch_bookly_app/features/search/domain/use_cases/search_use_case.dart';
import 'package:clean_arch_bookly_app/features/search/presentation/controller/search_cubit/search_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit({required this.searchUseCase}) : super(SearchInitialState());

  final SearchUseCase searchUseCase;

  Future<void> fetchSearchedBooks(
      {required String bookName, int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(SearchedBooksLoadingState());
    } else {
      emit(SearchedBooksPaginationLoadingState());
    }

    var listOfBooksEntitiesOrFailure =
        await searchUseCase.execute(param: pageNumber, param2: bookName);
    listOfBooksEntitiesOrFailure.fold((failure) {
      if (pageNumber == 0) {
        emit(SearchedBooksFailureState(error: failure.errorMessage));
      } else {
        emit(SearchedBooksPaginationFailureState(error: failure.errorMessage));
      }
    }, (searchedBooks) {
      emit(SearchedBooksSuccessState(searchedBooks: searchedBooks));
    });
  }
}
