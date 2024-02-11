import 'package:clean_arch_bookly_app/features/home/presentation/controller/featured_books_cubit/featured_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates>
{
  FeaturedBooksCubit():super(FeaturedBooksInitialState());

}