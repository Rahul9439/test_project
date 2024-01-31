import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:test_project/controller/home_controller.dart';
import 'package:test_project/view/home_screen.dart';
import 'package:test_project/widget/common_text.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: const Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: Text(
                        'User Details',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            body: controller.loading
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl:
                              '${controller.userModel?.results?.first.picture?.large}',
                          placeholder: (context, url) => Image.asset(
                            'assets/image/loading_gif.gif',
                            height: 130,
                          ),
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ).paddingOnly(bottom: 20, top: 20),
                      CommonText(
                          title: 'Name',
                          subtitle:
                              '${controller.userModel?.results?.first.name?.title} ${controller.userModel?.results?.first.name?.first} ${controller.userModel?.results?.first.name?.last}'),
                      CommonText(
                          title: 'Location',
                          subtitle:
                              '${controller.userModel?.results?.first.location?.city}, ${controller.userModel?.results?.first.location?.state}, ${controller.userModel?.results?.first.location?.country}, ${controller.userModel?.results?.first.location?.postcode}'),
                      CommonText(
                          title: 'Email',
                          subtitle:
                              '${controller.userModel?.results?.first.email}'),
                      CommonText(
                          title: 'DOB',
                          subtitle:
                              '${controller.userModel?.results?.first.dob?.age}, ${controller.userModel?.results?.first.dob?.date}'),
                      CommonText(
                          title: 'Number of days passed since registered',
                          subtitle:
                              '${controller.userModel?.results?.first.registered?.age}, ${controller.userModel?.results?.first.registered?.date}'),
                    ],
                  ).paddingSymmetric(horizontal: 20),
          );
        });
  }
}
