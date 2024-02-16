import '../../../../home/domain/entities/book_entity.dart';

abstract class SearchStates {}

class SearchInitialState extends SearchStates {}

class SearchedBooksLoadingState extends SearchStates {}
class SearchedBooksPaginationLoadingState extends SearchStates {}

class SearchedBooksSuccessState extends SearchStates {
  List<BookEntity> searchedBooks;

  SearchedBooksSuccessState({required this.searchedBooks});
}

class SearchedBooksFailureState extends SearchStates {
  String error;

  SearchedBooksFailureState({required this.error});
}
class SearchedBooksPaginationFailureState extends SearchStates {
  String error;

  SearchedBooksPaginationFailureState({required this.error});
}
