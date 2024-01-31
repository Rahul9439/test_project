import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:test_project/controller/home_controller.dart';

import '../widget/common_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue,
                title: const Center(
                  child: Text(
                    'Home Page',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              body: Center(
                child: controller.loading
                    ? const CircularProgressIndicator()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              imageUrl: controller.randomDogImage,
                              placeholder: (context, url) => Image.asset(
                                'assets/image/loading_gif.gif',
                                height: 300,
                              ),
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ).paddingOnly(bottom: 20, left: 20, right: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CommonButton(
                                  onPressed: controller.getRandomDog,
                                  text: 'Refresh'),
                              CommonButton(
                                  onPressed: controller.getUserDetail,
                                  text: 'Profile'),
                            ],
                          ),
                          CommonButton(
                              onPressed: controller.enableBluetooth,
                              text: 'Bluetooth'),
                        ],
                      ),
              ));
        });
  }
}
