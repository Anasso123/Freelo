import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freelo_ecommerce/auth/domain/repositories/base_signup_repository.dart';
import 'package:freelo_ecommerce/auth/shared/params/user_params.dart';
import 'package:freelo_ecommerce/core/domain/error/failure.dart';
import 'package:freelo_ecommerce/core/domain/usecase/base_usecase.dart';


class SignUpWithAppUseCase extends BaseUseCase<String, UserParams> {
  final BaseSignUpRepository baseRepository;

  SignUpWithAppUseCase(this.baseRepository);

  @override
  Future<Either<Failure, String>> call(UserParams parameters) async {
    return await baseRepository.signUpWithApp(parameters);
  }
}
