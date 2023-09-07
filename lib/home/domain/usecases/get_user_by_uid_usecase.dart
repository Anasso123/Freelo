import 'package:dartz/dartz.dart';
import 'package:freelo_ecommerce/core/domain/entities/user.dart';
import 'package:freelo_ecommerce/core/domain/error/failure.dart';
import 'package:freelo_ecommerce/core/domain/usecase/base_usecase.dart';
import 'package:freelo_ecommerce/home/domain/repository/base_home_repository.dart';

class GetUserByUidUseCase extends BaseUseCase<User, String> {
  final BaseHomeRepository baseHomeRepository;

  GetUserByUidUseCase(this.baseHomeRepository);
  @override
  Future<Either<Failure, User>> call(String parameters) async {
    return await baseHomeRepository.getUserByUid(parameters);
  }
}
