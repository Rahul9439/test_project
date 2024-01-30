import 'package:get/get_connect/connect.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_project/model/user_model.dart';

class NetworkConnect extends GetConnect {

  Future<String> getDogImage() async {
    final response = await get('https://dog.ceo/api/breeds/image/random');
    return response.body['message'];
  }

  Future<UserModel?> getUser() async {
    final response = await get('https://randomuser.me/api/',
    decoder: (d)=>UserModel.fromJson(d));
    return response.body;
  }

}
