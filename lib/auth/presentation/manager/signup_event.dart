part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();
}

class SignupWithGoogleEvents extends SignupEvent {
  final BuildContext context;

  const SignupWithGoogleEvents(this.context);
  @override
  List<Object?> get props => [context];
}

class SignUpWithAppEvents extends SignupEvent {
  final UserParams params;
  const SignUpWithAppEvents(this.params);
  @override
  List<Object?> get props => [params];
}

class SignUpWithFacebookEvents extends SignupEvent {
  final BuildContext context;

  const SignUpWithFacebookEvents(this.context);
  @override
  List<Object?> get props => [context];
}
