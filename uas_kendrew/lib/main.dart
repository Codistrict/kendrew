// ignore_for_file: todo
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uas_kendrew/home/ui_home.dart';
import 'package:uas_kendrew/login/ui_login.dart';

import 'package:uas_kendrew/themes/colors.dart';
import 'package:uas_kendrew/ui_calendar.dart';

import 'global_var.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: "UAS KENDREW",
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 2460,
        minWidth: 480,
        defaultScale: false,
        breakpoints: const [
          ResponsiveBreakpoint.resize(480, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET, scaleFactor: 0.8),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: "4K", scaleFactor: 0.8)
        ],
        background: Container(
          color: surfaceColor,
        ),
      ),
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        appBarTheme: const AppBarTheme(
          color: secondaryColor,
          shadowColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 100,
        ),
        primaryColor: secondaryColor,
      ),
      home: const MyApp(),
      // home: const CalendarSf(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAuthPref().whenComplete(() {
      debugPrint(userID);
      debugPrint("$userStatus");
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> setAuthPref(String userID, int userStatus) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userID', userID);
    await prefs.setInt('userStatus', userStatus);
  }

  Future<void> getAuthPref() async {
    final prefs = await SharedPreferences.getInstance();

    userID = prefs.getString('userID') ?? "";
    userStatus = prefs.getInt('userStatus') ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1));
    if (userID != "" && userStatus != 0) {
      return const HomePage();
    } else {
      return const LoginPage();
    }
  }
}
