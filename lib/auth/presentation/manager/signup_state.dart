part of 'signup_bloc.dart';

class SignupState extends Equatable {
  final List<UserCredential?> userCredential;
  final RequestState signUpState;
  final String message;

  const SignupState({
    this.userCredential = const [],
    this.signUpState = RequestState.loading,
    this.message = '',
  });

  SignupState copyWith({
    List<UserCredential?>? userCredential,
    RequestState? signUpState,
    String? message,
  }) {
    return SignupState(
      userCredential: userCredential ?? this.userCredential,
      signUpState: signUpState ?? this.signUpState,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [userCredential, signUpState, message];
}
