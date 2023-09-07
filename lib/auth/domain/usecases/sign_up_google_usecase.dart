import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:freelo_ecommerce/auth/domain/repositories/base_signup_repository.dart';
import 'package:freelo_ecommerce/core/domain/error/failure.dart';
import 'package:freelo_ecommerce/core/domain/usecase/base_usecase.dart';

class SignUpWithGoogleUseCase
    extends BaseUseCase<UserCredential?, BuildContext> {
  final BaseSignUpRepository baseRepository;

  SignUpWithGoogleUseCase(this.baseRepository);

  @override
  Future<Either<Failure, UserCredential?>> call(BuildContext parameters) async {
    return await baseRepository.signUpWithGoogle(parameters);
  }
}
