import 'package:clean_arch_bookly_app/features/home/presentation/controller/newest_books_cubit/newest_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksStates> {
  NewestBooksCubit() : super(NewestBooksInitialState());
}
