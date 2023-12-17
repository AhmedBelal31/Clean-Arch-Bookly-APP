import 'package:clean_arch_bookly_app/features/search/data/repos/search_reo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/api_service.dart';
import '../../../home/data/models/book_model.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  const SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, BookModel>> fetchSearchBooks(
      {required String query}) async {
    try {
      var data =
          await apiService.getData(endPoint: 'volumes?Sorting=newest&q=$query');
      return right(BookModel.fromJson(data));
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
