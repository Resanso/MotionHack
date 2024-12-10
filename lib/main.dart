import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slicing_ui/pages/login_page.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    print('pause 2 seconds');
    await Future.delayed(const Duration(seconds: 1));
    print('unpause');
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return const LoginPage();
  }
}
