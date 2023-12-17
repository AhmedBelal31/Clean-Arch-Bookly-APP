import 'package:bloc/bloc.dart';
import '../../../data/repos/home_repo.dart';
import 'similar_books_states.dart';

class SimilarBookCubit extends Cubit<SimilarBookStates> {
  final HomeRepo homeRepo;

  SimilarBookCubit(this.homeRepo) : super(InitialState());

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoadingState());
    var result = await homeRepo.fetchSimilartBooks(category: category);
    result.fold((failure) {
      emit(SimilarBooksErrorState(error: failure.errorMessage));
    }, (newestBooks) {
      // for(var e in newestBooks.items)
      //   {
      //     print(e.volumeInfo.categories[0]);
      //   }
      emit(SimilarBooksSuccessState(bookModel: newestBooks));
    });
  }
}
