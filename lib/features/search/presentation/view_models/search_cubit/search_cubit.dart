import 'package:bloc/bloc.dart';
import '../../../data/repos/search_reo.dart';
import 'search_states.dart';

class SearchCubit extends Cubit<SearchStates> {
  final SearchRepo searchRepo;

  SearchCubit(this.searchRepo) : super(InitialState());

  Future<void> fetchSearchBooks(String query) async {
    emit(SearchLoadingState());
    var result = await searchRepo.fetchSearchBooks(query: query);
    //print(result);
    result.fold((failure) {
      emit(SearchErrorState(error: failure.errorMessage));
    }, (newestBooks) {
      emit(SearchSuccessState(bookModel: newestBooks));
    });
  }
}
