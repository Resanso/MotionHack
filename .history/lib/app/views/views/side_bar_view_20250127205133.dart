import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testgetcli/app/modules/Login/views/login_view.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green[900],
              ),
              accountName: const Text('Resan So'),
              accountEmail: const Text('resan@blabalba.blablabal'),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Get.to(LoginPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
