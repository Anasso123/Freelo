import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:freelo_ecommerce/core/data/models/user_model.dart';
import 'package:freelo_ecommerce/core/domain/error/failure.dart';
import 'package:freelo_ecommerce/core/domain/functions/check_internet.dart';
import 'package:freelo_ecommerce/home/data/datasource/home_datasource.dart';
import 'package:freelo_ecommerce/home/domain/repository/base_home_repository.dart';
import 'package:hive/hive.dart';

class HomeRepository implements BaseHomeRepository {
  final BaseHomeDatasource baseHomeDatasource;

  HomeRepository(this.baseHomeDatasource);

  @override
  Future<Either<Failure, UserModel>> getUserByUid(String uid) async{
    try {
      print('check internet ${checkInternet()}');
      if(await checkInternet() == true){
        final result = await baseHomeDatasource.getUserByUid(uid);
        var userBox = Hive.box('user');
        await userBox.put('selected', 'Acceuil');
        return Right(result);
      }else{
       return const Left(ConnectionFailure(message: 'No Connection'));
      }
    } on FirebaseException catch (e) {
      return Left(ServerFailure(message: e.message!));
    }
  }
}
