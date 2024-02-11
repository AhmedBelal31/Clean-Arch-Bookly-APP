import '../../../domain/entities/book_entity.dart';

abstract class FeaturedBooksStates {}

class FeaturedBooksInitialState extends FeaturedBooksStates {}

class FeaturedBooksLoadingState extends FeaturedBooksStates {}

class FeaturedBooksSuccessState extends FeaturedBooksStates {
  List<BookEntity> books;

  FeaturedBooksSuccessState({required this.books});
}

class FeaturedBooksFailureState extends FeaturedBooksStates {
  String error;

  FeaturedBooksFailureState(this.error);
}
