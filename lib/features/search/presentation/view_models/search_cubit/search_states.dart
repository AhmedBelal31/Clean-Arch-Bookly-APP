import '../../../../home/data/models/book_model.dart';

abstract class SearchStates {
  const SearchStates() ;
}

class InitialState extends SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchSuccessState extends SearchStates {
  final BookModel bookModel ;
  const SearchSuccessState({required this.bookModel});
}

class SearchErrorState extends SearchStates {
  final String error;

  const SearchErrorState({required this.error});
}
