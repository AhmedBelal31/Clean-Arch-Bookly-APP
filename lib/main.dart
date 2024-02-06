import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'const.dart';
import 'core/utils/app_router.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/service_locator.dart';
// import 'features/home/data/repos/home_repo_impl.dart';
// import 'features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
// import 'features/home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';

void main()async {
  // ApiService.init();
  // setupServiceLocator();
 await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox(kFeaturedBox);
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          )),
      routerConfig: AppRouter.router,
    );
  }
}
