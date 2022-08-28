import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:machine_test/view/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.72727272727275, 738.1818181818181),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child){
      return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
         appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        foregroundColor: Colors.black,
        ),
        ),
        home: LoginScreen(),
      );
      }
    );
  }
}
