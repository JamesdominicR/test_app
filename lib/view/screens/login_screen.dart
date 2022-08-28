import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:machine_test/controller/login_controller.dart';
import 'package:machine_test/core/colors.dart';
import 'package:machine_test/core/constants.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25,right: 25),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  kheight100,
                  Center(
                    child: SizedBox(
                      height: 100.h,
                      width: 100.w,
                      child: Image.asset('assets/images/profile_img.png'),
                    ),
                  ),
                  kheight10,
                  Text('Welcome Back',
                  style:  TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  kheight5,
                  Text('Sign to continue',
                  style: TextStyle(
                    color: ktextWhite,
                    fontSize: 15.sp,
                  ),
                  ),
                  kheight45,
                   Theme (
                    data: ThemeData().copyWith(
            
                              colorScheme: ThemeData().colorScheme.copyWith(
                                primary: Colors.green,
                                secondary: Colors.green,
                              
                              )
                            ),
                   child: TextFormField(
                      style: const TextStyle(color: Colors.green),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              hintText: 'Email',
                              prefixIcon: const Icon(Icons.email),
                            ),
                            controller: _emailController,
                            ),   
                   ),
                          kheight20,
                          Theme(
                            data: ThemeData().copyWith(
            
                              colorScheme: ThemeData().colorScheme.copyWith(
                                primary: Colors.green,
                                secondary: Colors.green,
                              
                              )
                            ),
                            child: TextFormField(
                              style: const TextStyle(color: Colors.green),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              hintText: 'Password',
                              prefixIcon: const Icon(Icons.lock),
                            ),
                            controller: _passwordController,
                            ),
                            
                          ),
                          kheight20,
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text('Forgot Password?',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: kgreen,
                              fontWeight: FontWeight.w600,
                            ),
                            ),
                          ),
                          kheight45,
                           GestureDetector(
                             child: Container(
                              height: 50.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: kgreen,
                              ),
                              child: Center(
                                child: Text('Login',
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                  ),
                              ),
                             ),
                             onTap: () {
                              final email = _emailController.text.trim();
                              final password = _passwordController.text.trim();
                              controller.userLogin(email,password);
                              controller.update();
                              print(email);
                             },
                           ),
                                                 kheight20,
                                                   RichText(
                              text: TextSpan(
                                  text: 'Don\'t have account?',
                                  style: TextStyle(
                                    color: const Color(0xff0E3746),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                   children: [
                                    TextSpan(
                                      text: ' create a new account',
                                      style: TextStyle(
                                        color: kgreen,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      recognizer: TapGestureRecognizer()..onTap = () {
                                       //page routing
                                      }
                                    ),
                                  ]
                              ),   
                            ),
                ],
              ),
            ),
          ),
        ),
    ),
    );
    
  }
}