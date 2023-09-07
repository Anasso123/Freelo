part of 'home_bloc.dart';

class HomeState extends Equatable {
  final RequestState requestState;
  final String message;
  final String connectionMessage;
  final List<User> user;

  const HomeState({
    this.requestState = RequestState.loading,
    this.message = '',
    this.connectionMessage = '',
    this.user = const [],
  });

  HomeState copyWith({
    RequestState? requestState,
    String? message,
    String? connectionMessage,
    List<User>? user,
  }) {
    return HomeState(
      requestState: requestState ?? this.requestState,
      message: message ?? this.message,
      connectionMessage: connectionMessage ?? this.connectionMessage,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [requestState, message, user, connectionMessage];
}
