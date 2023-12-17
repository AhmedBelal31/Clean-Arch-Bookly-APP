import 'package:bloc/bloc.dart';
import '../../../data/repos/home_repo.dart';
import 'newest_books_states.dart';

class NewestBookCubit extends Cubit<NewestBookStates> {
  final HomeRepo homeRepo;

  NewestBookCubit(this.homeRepo) : super(InitialState());

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoadingState());
    var result = await homeRepo.fetchNewestBooks();
    result.fold((failure) {
      emit(NewestBooksErrorState(error: failure.errorMessage));
    }, (newestBooks) {
      emit(NewestBooksSuccessState(bookModel: newestBooks));
    });
  }
}
