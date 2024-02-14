import 'package:clean_arch_bookly_app/features/home/presentation/controller/newest_books_cubit/newest_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/controller/newest_books_cubit/newest_books_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/services/styles.dart';
import '../../../../core/utils/widgets/custom_error_message.dart';
import '../../../../core/utils/widgets/custom_loading_indicator.dart';
import '../../domain/entities/book_entity.dart';
import 'featured_books_bloc_builder.dart';
import 'newest_books_bloc_consumer.dart';
import 'newest_books_list_view.dart';
import 'custom_app_bar.dart';
import 'newest_books_list_view_item.dart';

class HomeVewBody extends StatelessWidget {
  const HomeVewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(),
        FeaturedBooksBlocBuilder(),
        Padding(
          padding: EdgeInsets.only(top: 40, bottom: 0),
          child: Text(
            'Newest Books ',
            style: Styles.textStyle30,
          ),
        ),
        NewestBooksBlocConsumer(),
      ],
    );
  }
}
