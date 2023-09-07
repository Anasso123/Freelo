part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetUserByUidEvent extends HomeEvent {
  final String uid;

  const GetUserByUidEvent(this.uid);

  @override
  List<Object?> get props => [uid];
}

class CheckConnectivityEvents extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class ConnectedEvents extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class NotConnectedEvents extends HomeEvent {
  @override
  List<Object?> get props => [];
}