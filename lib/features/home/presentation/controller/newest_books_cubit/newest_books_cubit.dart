import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/controller/newest_books_cubit/newest_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksStates> {
  NewestBooksCubit(this.fetchNewestBooksUseCase)
      : super(NewestBooksInitialState());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoadingState());
    var listOfBookEntityOrFailure = await fetchNewestBooksUseCase.execute();
    listOfBookEntityOrFailure.fold(
      (failure) => emit(NewestBooksFailureState(failure.errorMessage)),
      (books) => emit(NewestBooksSuccessState(books: books)),
    );
  }
}
