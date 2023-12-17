

import '../../../data/models/book_model.dart';

abstract class NewestBookStates {
  const NewestBookStates();
}

class InitialState extends NewestBookStates {}

class NewestBooksLoadingState extends NewestBookStates {}

class NewestBooksSuccessState extends NewestBookStates {
  final BookModel bookModel;

  const NewestBooksSuccessState({required this.bookModel});
}

class NewestBooksErrorState extends NewestBookStates {
  final String error;

  const NewestBooksErrorState({required this.error});
}
