import '../../../data/models/book_model.dart';

abstract class FeaturedBookStates {
  const FeaturedBookStates();
}

class InitialState extends FeaturedBookStates {}

class FeaturedBooksLoadingState extends FeaturedBookStates {}

class FeaturedBooksSuccessState extends FeaturedBookStates {
  final BookModel bookModel;

  const FeaturedBooksSuccessState({required this.bookModel});
}

class FeaturedBooksErrorState extends FeaturedBookStates {
  final String error;

  const FeaturedBooksErrorState({required this.error});
}
