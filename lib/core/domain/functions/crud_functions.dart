import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:freelo_ecommerce/core/domain/constants/enums.dart';
import 'package:http/http.dart' as http;
import 'check_internet.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkUrl, Map data) async {
    try {
      if (await checkInternet()) {
        print('Internet checked');
        var response = await http.post(Uri.parse(linkUrl), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          if (responseBody['status'] == 'email Already exist') {
            return const Left(StatusRequest.alreadyExist);
          }
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
    }
  }
}
