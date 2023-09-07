import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freelo_ecommerce/core/data/models/user_model.dart';
import 'package:hive/hive.dart';

abstract class BaseHomeDatasource {
  Future<UserModel> getUserByUid(String uid);
}

class HomeDatasource implements BaseHomeDatasource {
  @override
  Future<UserModel> getUserByUid(String uid) async {
    final docUser = FirebaseFirestore.instance.collection('User').doc(uid);
    final snapshot = await docUser.get();
    if (snapshot.exists) {
      return UserModel.fromJson(snapshot.data()!);
    }else{
      return UserModel.fromJson(snapshot.data()!);
    }
  }
}
