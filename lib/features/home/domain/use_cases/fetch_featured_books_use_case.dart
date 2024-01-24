import 'package:clean_arch_bookly_app/core/errors/failures.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/use_case/use_case.dart';




class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity> , void>
{
  HomeRepo homeRepo ;
  FetchFeaturedBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> execute([void param])  async{
    return await homeRepo.fetchFeaturedBooks() ;
  }

  // Future<Either<Failure , List<BookEntity>>> execute() async
  // {
  //   // Maybe I can do something in the future , 'Check Permissions'
  //   return await homeRepo.fetchFeaturedBooks() ;
  // }


}
