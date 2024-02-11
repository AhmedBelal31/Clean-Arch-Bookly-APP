import 'package:go_router/go_router.dart';
import '../../../features/home/presentation/views/home_view.dart';
import '../../../features/search/presentation/views/search_view.dart';
import '../../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/HomeView';

  static const kBookDetailsView = '/BookDetailsView';

  static const kSearchView = '/kSearchView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kSearchView,
      builder: (context, state) => const SearchView(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
    // GoRoute(
    //   path: kBookDetailsView,
    //   builder: (context, state) => BlocProvider(
    //     create:(context)=>SimilarBookCubit(
    //       getIt.get<HomeRepoImpl>(),
    //     ),
    //     child: BookDetailsView(
    //       bookModel:state.extra as BookModel,
    //       //index:int.parse(state.pathParameters['index']!) ,
    //
    //     ),
    //   ),
    // ),
  ]);
}
