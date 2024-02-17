import 'package:dartz/dartz.dart';
import '../errors/failures.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> execute([Param param]);
}
