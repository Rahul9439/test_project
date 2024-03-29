import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';

import '../Utils/network_connect.dart';
import '../model/user_model.dart';

class HomeController extends GetxController {
  NetworkConnect service = Get.put(NetworkConnect());
  UserModel? userModel;
  String randomDogImage = '';
  bool loading = false;
  final MethodChannel channel = const MethodChannel('bluetooth_channel');

  @override
  void onInit() {
    super.onInit();
    getRandomDog();
  }

  Future<void> getUserDetail() async {
    Get.toNamed('/UserScreen');
    loading = true;
    update();
    var response = await service.getUser();
    userModel = response;
    loading = false;
    update();
  }

  Future<void> getRandomDog() async{
    loading = true;
    update();
    String image = await service.getDogImage();
    randomDogImage = image;
    loading = false;
    update();
    }

  void enableBluetooth() async {
    try {
      final String result = await channel.invokeMethod('enableBluetooth');
      if (kDebugMode) {
        print(result);
      }
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed to enable Bluetooth: ${e.message}");
      }
    }
  }

}
