import 'package:clean_arch_bookly_app/features/home/presentation/controller/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/controller/featured_books_cubit/featured_books_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/services/styles.dart';
import '../../../../core/utils/widgets/custom_error_message.dart';
import '../../../../core/utils/widgets/custom_loading_indicator.dart';
import 'newest_books_list_view.dart';
import 'custom_app_bar.dart';
import 'featured_books_list_view.dart';

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
          BlocBuilder<FeaturedBooksCubit, FeaturedBooksStates>(
            builder: (context, state) {
              if (state is FeaturedBooksSuccessState) {
                return const FeaturedBooksListView();
              } else if (state is FeaturedBooksFailureState) {
                return CustomErrorMessage(errorMessage: state.error);
              } else {
                return const CustomLoadingIndicator();
              }
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 0),
                  child: Text(
                    'Best Seller ',
                    style: Styles.textStyle30,
                  ),
                ),
                NewestBooksListView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
