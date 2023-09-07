import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:freelo_ecommerce/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:freelo_ecommerce/auth/domain/repositories/base_signup_repository.dart';
import 'package:freelo_ecommerce/auth/shared/params/user_params.dart';
import 'package:freelo_ecommerce/core/data/models/user_model.dart';
import 'package:freelo_ecommerce/core/domain/error/exception.dart';
import 'package:freelo_ecommerce/core/domain/error/failure.dart';
import 'package:freelo_ecommerce/home/presentation/pages/home_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpRepository implements BaseSignUpRepository {
  final BaseAuthRemoteDatasource baseAuthRemoteDatasource;

  SignUpRepository({required this.baseAuthRemoteDatasource});

  @override
  Future<Either<Failure, UserCredential?>> signUpWithGoogle(context) async {
    try {
      // Begin interactive sign in process
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      // obtain auth details from request
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;
      // create a new credential for user
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );
      // finally, let's sign in
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = FirebaseAuth.instance.currentUser;
      baseAuthRemoteDatasource.saveUser(
        userModel: UserModel(
          uid: userCredential.user!.uid,
          email: userCredential.user!.email!,
          name: userCredential.user!.displayName!,
          phone: userCredential.user!.phoneNumber ?? "0000000000",
          imageUrl: userCredential.user!.photoURL!,
          auth_method: userCredential.credential!.signInMethod,
          password: userCredential.user!.refreshToken,
        ),
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(message: e.message!));
    }
  }

  @override
  Future<Either<Failure, String>> signUpWithApp(UserParams params) async {
    final result = await baseAuthRemoteDatasource.saveUser(
        userModel: UserModel(
      uid: params.uid,
      email: params.email,
      name: params.name,
      phone: params.phone,
      imageUrl: params.imageUrl,
      auth_method: params.auth_method,
      password: params.password,
    ));
    try {
      return const Right('inserted');
    } on NetworkException catch (failure) {
      return Left(ServerFailure(message: failure.errorMessage));
    }
  }

  @override
  Future<Either<Failure, UserCredential?>> signUpWithFacebook(
      BuildContext context) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      print("Email : ${userCredential.user!.email}");
      baseAuthRemoteDatasource.saveUser(
        userModel: UserModel(
          uid: userCredential.user!.uid,
          email: userCredential.user!.email!,
          name: userCredential.user!.displayName!,
          phone: userCredential.user!.phoneNumber ?? "0000000000",
          imageUrl: userCredential.user!.photoURL!,
          auth_method: userCredential.credential!.signInMethod,
          password: userCredential.user!.refreshToken,
        ),
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(message: e.message!));
    }
  }
}
