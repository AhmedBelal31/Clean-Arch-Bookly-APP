import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/controller/featured_books_cubit/featured_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FeaturedBooksCubit extends Cubit<FeaturedBooksStates> {
  FeaturedBooksCubit(this.featuredBooksUseCase)
      : super(FeaturedBooksInitialState());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> fetchFeaturedBooks({int pageNumber=0}) async {
    emit(FeaturedBooksLoadingState());
  var listOfBooksEntitiesOrFailure = await featuredBooksUseCase.execute(pageNumber);
  listOfBooksEntitiesOrFailure.fold((failure) {
      emit(FeaturedBooksFailureState(failure.errorMessage));
      return;
    }, (books) {
      emit(FeaturedBooksSuccessState(books: books));
      return;
    });
  }
}
