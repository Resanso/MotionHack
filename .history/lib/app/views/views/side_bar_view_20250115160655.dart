import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SideBarView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SideBarView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SideBarView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
