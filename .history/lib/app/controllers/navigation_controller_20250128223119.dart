import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgetcli/app/modules/Profile/views/profile_view.dart';
import 'package:testgetcli/app/modules/favorite/views/favorite_view.dart';
import 'package:testgetcli/app/modules/home/views/home_view.dart';

class NavigationController extends GetxController {
  final currentIndex = 0.obs;

  final screens = [
    const HomeView(),
    FavoriteView(),
    ProfileView(),
  ];

  void changePage(int index) {
    currentIndex.value = index;
  }
}
