import 'package:freelo_ecommerce/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:freelo_ecommerce/auth/data/repository/sign_up_repository.dart';
import 'package:freelo_ecommerce/auth/domain/repositories/base_signup_repository.dart';
import 'package:freelo_ecommerce/auth/domain/usecases/sign_up_app.dart';
import 'package:freelo_ecommerce/auth/domain/usecases/sign_up_facebook.dart';
import 'package:freelo_ecommerce/auth/domain/usecases/sign_up_google_usecase.dart';
import 'package:freelo_ecommerce/auth/presentation/manager/signup_bloc.dart';
import 'package:freelo_ecommerce/home/data/datasource/home_datasource.dart';
import 'package:freelo_ecommerce/home/data/repository/home_repository.dart';
import 'package:freelo_ecommerce/home/domain/repository/base_home_repository.dart';
import 'package:freelo_ecommerce/home/domain/usecases/get_user_by_uid_usecase.dart';
import 'package:freelo_ecommerce/home/presentation/manager/home_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class DependencyInjection {
  void init() {
    ///////////////////////////////////// Bloc /////////////////////////////////////
    // Sign up Bloc
    sl.registerFactory(
      () => SignupBloc(sl(), sl(), sl()),
    );
    // Home Bloc
    sl.registerFactory(
          () => HomeBloc(sl()),
    );

    //////////////////////////////// Use Cases //////////////////////////////////////
    // Sign up with google use cases
    sl.registerLazySingleton(
      () => SignUpWithGoogleUseCase(sl()),
    );
    // sign up with app use cases
    sl.registerLazySingleton(
      () => SignUpWithAppUseCase(sl()),
    );
    sl.registerLazySingleton(() => SignUpWithFacebookUseCase(sl()));
    // get user by uid
    sl.registerLazySingleton(() => GetUserByUidUseCase(sl()));

    ////////////////////////////// Repository ////////////////////////////////////////
    // Sign up Repository
    sl.registerLazySingleton<BaseSignUpRepository>(
        () => SignUpRepository(baseAuthRemoteDatasource: sl()));
    // Home Repository
    sl.registerLazySingleton<BaseHomeRepository>(
            () => HomeRepository(sl()));

    ///////////////////////////// Remote Datasource //////////////////////////////////
    // Remote Datasource
    sl.registerLazySingleton<BaseAuthRemoteDatasource>(
      () => AuthRemoteDatasource(),
    );
    // Home remote datasource
    sl.registerLazySingleton<BaseHomeDatasource>(
          () => HomeDatasource(),
    );
  }
}
