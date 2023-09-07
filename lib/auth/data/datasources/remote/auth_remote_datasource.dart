import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freelo_ecommerce/core/data/models/user_model.dart';
import 'package:hive/hive.dart';

abstract class BaseAuthRemoteDatasource {
  Future saveUser({required UserModel userModel});
}

class AuthRemoteDatasource implements BaseAuthRemoteDatasource {
  @override
  Future saveUser({
    required UserModel userModel,
  }) async {
    final docUser = FirebaseFirestore.instance.collection('User').doc();

    final user = UserModel(
      uid: docUser.id,
      email: userModel.email,
      name: userModel.name,
      phone: userModel.phone,
      imageUrl: userModel.imageUrl,
      auth_method: userModel.auth_method,
      password: userModel.password,
    );

    final json = user.toJson();

    await docUser.set(json);

    var userBox = Hive.box('user');
    await userBox.put('user', docUser.id);
    print('user cached : ${userBox.get('user')}');
  }
}
