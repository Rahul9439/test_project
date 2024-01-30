import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:test_project/view/home_screen.dart';

import '../view/UserScreen.dart';

var route = [
  GetPage(
    name: '/',
    title: 'HomeScreen',
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: '/UserScreen',
    title: 'UserScreen',
    page: () => const UserScreen(),
  ),
];