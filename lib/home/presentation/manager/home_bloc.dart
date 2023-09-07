import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:freelo_ecommerce/core/domain/constants/enums.dart';
import 'package:freelo_ecommerce/core/domain/entities/user.dart';
import 'package:freelo_ecommerce/home/domain/usecases/get_user_by_uid_usecase.dart';
import 'package:hive/hive.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetUserByUidUseCase userByUidUseCase;
  StreamSubscription? _subscription;

  HomeBloc(this.userByUidUseCase) : super(const HomeState()) {
    on<HomeEvent>((event, emit) {
      if(event is ConnectedEvents){
        emit(state.copyWith(connectionMessage: 'Connected'));
      }else if(event is NotConnectedEvents){
        emit(state.copyWith(connectionMessage: 'Not Connected'));
      }
    });
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        add(ConnectedEvents());
      }else{
        add(NotConnectedEvents());
      }
    });
    on<GetUserByUidEvent>(_getUserByUid);
    on<CheckConnectivityEvents>(_checkConnectivity);
  }

  FutureOr<void> _getUserByUid(
      GetUserByUidEvent event, Emitter<HomeState> emit) async {
    final result = await userByUidUseCase.call(event.uid);
    result.fold(
      (l) => emit(
          state.copyWith(requestState: RequestState.error, message: l.message)),
      (r) => emit(state.copyWith(requestState: RequestState.loaded, user: [r])),
    );
  }

  FutureOr<void> _checkConnectivity(
      CheckConnectivityEvents event, Emitter<HomeState> emit) {}

  @override
  Future<void> close() {
    _subscription!.cancel();
    return super.close();
  }
}
