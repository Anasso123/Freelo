import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:freelo_ecommerce/auth/shared/params/user_params.dart';
import 'package:freelo_ecommerce/core/domain/error/failure.dart';

abstract class BaseSignUpRepository {
  Future<Either<Failure, UserCredential?>> signUpWithGoogle(BuildContext context);
  Future<Either<Failure, UserCredential?>> signUpWithFacebook(BuildContext context);
  Future<Either<Failure, String>> signUpWithApp(UserParams params);
}
