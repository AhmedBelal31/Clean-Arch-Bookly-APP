import '../../../data/models/book_model.dart';

abstract class SimilarBookStates {
  const SimilarBookStates();
}

class InitialState extends SimilarBookStates {}

class SimilarBooksLoadingState extends SimilarBookStates {}

class SimilarBooksSuccessState extends SimilarBookStates {
  final BookModel bookModel;

  const SimilarBooksSuccessState({required this.bookModel});
}

class SimilarBooksErrorState extends SimilarBookStates {
  final String error;

  const SimilarBooksErrorState({required this.error});
}
