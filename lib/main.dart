import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:testgetcli/app/modules/LoginPage/views/login_page_view.dart';
import 'package:testgetcli/app/modules/home/views/home_view.dart';
=======
import 'package:slicing_ui/pages/login_page.dart';
>>>>>>> 134859853d28b24a9a012748434842bf065df9a5

void main() {
  runApp(const MyApp());
}

<<<<<<< HEAD
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
=======
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // return const myCart();
    return const LoginPage();
    // return const invoice();
>>>>>>> 134859853d28b24a9a012748434842bf065df9a5
  }
}
