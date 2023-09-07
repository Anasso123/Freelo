import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:freelo_ecommerce/auth/domain/usecases/sign_up_app.dart';
import 'package:freelo_ecommerce/auth/domain/usecases/sign_up_facebook.dart';
import 'package:freelo_ecommerce/auth/domain/usecases/sign_up_google_usecase.dart';
import 'package:freelo_ecommerce/auth/shared/params/user_params.dart';
import 'package:freelo_ecommerce/core/domain/constants/enums.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignUpWithAppUseCase signUpWithAppUseCase;
  final SignUpWithFacebookUseCase signUpWithFacebookUseCase;
  final SignUpWithGoogleUseCase signUpWithGoogleUseCase;

  SignupBloc(
    this.signUpWithGoogleUseCase,
    this.signUpWithAppUseCase,
    this.signUpWithFacebookUseCase,
  ) : super(const SignupState()) {
    on<SignupWithGoogleEvents>(_onSignUpWithGoogle);
    on<SignUpWithAppEvents>(_onSignUpWithApp);
    on<SignUpWithFacebookEvents>(_onSignUpWithFacebook);
  }

  FutureOr<void> _onSignUpWithGoogle(
    SignupWithGoogleEvents event,
    Emitter<SignupState> emit,
  ) async {
    final result = await signUpWithGoogleUseCase(event.context);
    result.fold(
        (l) => emit(state.copyWith(
              signUpState: RequestState.error,
              message: l.message,
            )),
        (userCredential) => emit(state.copyWith(
              userCredential: [userCredential],
              signUpState: RequestState.loaded,
            )));
  }

  FutureOr<void> _onSignUpWithApp(
      SignUpWithAppEvents event, Emitter<SignupState> emit) async {
    final result = await signUpWithAppUseCase(event.params);
    result.fold(
        (l) => emit(
              state.copyWith(
                signUpState: RequestState.error,
                message: l.message,
              ),
            ),
        (r) => emit(state.copyWith(
              signUpState: RequestState.loaded,
              message: r,
            )));
  }

  FutureOr<void> _onSignUpWithFacebook(SignUpWithFacebookEvents event, Emitter<SignupState> emit) async{
    final result = await signUpWithFacebookUseCase(event.context);
    result.fold(
            (l) => emit(state.copyWith(
          signUpState: RequestState.error,
          message: l.message,
        )),
            (userCredential) => emit(state.copyWith(
          userCredential: [userCredential],
          signUpState: RequestState.loaded,
        )));
  }
}
