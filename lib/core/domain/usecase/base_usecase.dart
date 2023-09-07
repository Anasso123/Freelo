import 'package:dartz/dartz.dart';
import 'package:freelo_ecommerce/core/domain/error/failure.dart';

abstract class BaseUseCase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}
