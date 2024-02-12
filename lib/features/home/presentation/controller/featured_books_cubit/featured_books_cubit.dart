import 'package:clean_arch_bookly_app/core/utils/services/api_service.dart';
import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/controller/featured_books_cubit/featured_books_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/book_model.dart';
import '../../../domain/entities/book_entity.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates> {
  FeaturedBooksCubit(this.featuredBooksUseCase)
      : super(FeaturedBooksInitialState());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoadingState());
  var listOfBooksEntitiesOrFailure = await featuredBooksUseCase.execute();
  listOfBooksEntitiesOrFailure.fold((failure) {
      emit(FeaturedBooksFailureState(failure.errorMessage));
      return;
    }, (books) {
      print('Test IS ${books[1].authorName}');
      emit(FeaturedBooksSuccessState(books: books));
      return;
    });
  }
}
