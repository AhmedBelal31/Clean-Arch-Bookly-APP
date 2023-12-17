import 'package:bloc/bloc.dart';

import '../../../data/repos/home_repo.dart';
import 'featured_books_states.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookStates> {
  final HomeRepo homeRepo;

  FeaturedBookCubit(this.homeRepo) : super(InitialState());

  // List<String> thumbnails ;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoadingState());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
     // print(failure.errorMessage);
      emit(FeaturedBooksErrorState(error: failure.errorMessage));
    }, (featuredBooks) {
      // print(featuredBooks.items[3].volumeInfo!.imageLinks!.thumbnail!);

      emit(FeaturedBooksSuccessState(bookModel: featuredBooks));
    });
  }
}
