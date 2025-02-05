import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../models/user_model.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfileView'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.user.value == null) {
          return Center(child: Text('Failed to load user profile'));
        } else {
          User user = controller.user.value!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${user.firstName} ${user.lastName}',
                    style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text('Email: ${user.email}', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text('Username: ${user.username}',
                    style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text('Phone: ${user.phone}', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text(
                    'Address: ${user.address?.address}, ${user.address?.city}, ${user.address?.state}, ${user.address?.country}',
                    style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
              ],
            ),
          );
        }
      }),
    );
  }
}
