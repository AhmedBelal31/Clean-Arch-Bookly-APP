import 'package:clean_arch_bookly_app/features/home/data/repos/home_reo_impl.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/controller/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/controller/newest_books_cubit/newest_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'const.dart';
import 'core/utils/services/api_service.dart';
import 'core/utils/services/app_router.dart';
import 'core/utils/services/bloc_observer.dart';
import 'core/utils/services/service_locator.dart';
import 'features/search/data/data_sources/local_data_source/search_local_data_source.dart';
import 'features/search/data/data_sources/search_remote_data_source/search_remote_data_source.dart';
import 'features/search/data/repos/search_repo_impl.dart';
import 'features/search/domain/use_cases/search_use_case.dart';
import 'features/search/presentation/controller/search_cubit/search_cubit.dart';


void main() async {
  // ApiService.init();
  setupServiceLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            FetchFeaturedBooksUseCase(
              homeRepo: getIt.get<HomeRepoImpl>(),
            ),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            FetchNewestBooksUseCase(
              homeRepo: getIt.get<HomeRepoImpl>(),
            ),
          )..fetchNewestBooks(),
        ),
        BlocProvider( create: (context) => SearchCubit(
          searchUseCase: FetchSearchedBooksUseCase(
            searchRepo: SearchRepoImpl(
              searchRemoteDataSource: SearchRemoteDataSourceImpl(
                apiService: ApiService(
                  Dio(),
                ),
              ),
              searchLocalDataSource: SearchLocalDataSourceImpl(),
            ),
          ),
        ),),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme: GoogleFonts.montserratTextTheme(
              ThemeData.dark().textTheme,
            )),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
