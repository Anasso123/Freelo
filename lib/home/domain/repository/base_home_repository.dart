import 'package:dartz/dartz.dart';
import 'package:freelo_ecommerce/core/domain/entities/user.dart';
import 'package:freelo_ecommerce/core/domain/error/failure.dart';

abstract class BaseHomeRepository {
  Future<Either<Failure, User>> getUserByUid(String uid);
}