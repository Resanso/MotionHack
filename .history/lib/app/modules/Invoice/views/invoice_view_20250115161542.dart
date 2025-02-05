import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/invoice_controller.dart';

class InvoiceView extends GetView<InvoiceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InvoiceView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'InvoiceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
