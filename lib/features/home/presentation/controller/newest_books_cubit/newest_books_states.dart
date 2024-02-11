import '../../../domain/entities/book_entity.dart';

abstract class NewestBooksStates {}

class NewestBooksInitialState extends NewestBooksStates {}

class NewestBooksLoadingState extends NewestBooksStates {}

class NewestBooksSuccessState extends NewestBooksStates {
  List<BookEntity> books;

  NewestBooksSuccessState({required this.books});
}

class NewestBooksFailureState extends NewestBooksStates {
  String error;

  NewestBooksFailureState(this.error);
}
