import 'package:clean_arch_bookly_app/features/home/presentation/controller/newest_books_cubit/newest_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/controller/newest_books_cubit/newest_books_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/services/styles.dart';
import '../../../../core/utils/widgets/custom_error_message.dart';
import '../../../../core/utils/widgets/custom_loading_indicator.dart';
import 'featured_books_bloc_builder.dart';
import 'newest_books_list_view.dart';
import 'custom_app_bar.dart';

class HomeVewBody extends StatefulWidget {
  const HomeVewBody({
    super.key,
  });

  @override
  State<HomeVewBody> createState() => _HomeVewBodyState();
}

class _HomeVewBodyState extends State<HomeVewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          const FeaturedBooksBlocBuilder(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 0),
                  child: Text(
                    'Newest Books ',
                    style: Styles.textStyle30,
                  ),
                ),
                BlocBuilder<NewestBooksCubit, NewestBooksStates>(
                  builder: (context, state) {
                    if (state is NewestBooksSuccessState) {
                      return NewestBooksListView(newestBooks: state.books);
                    } else if (state is NewestBooksFailureState) {
                      return CustomErrorMessage(errorMessage: state.error);
                    } else {
                      return const CustomLoadingIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
