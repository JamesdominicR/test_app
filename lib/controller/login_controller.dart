import 'package:get/get.dart';
import 'package:machine_test/model/login_model.dart';
import 'package:machine_test/services/api_service.dart';
import 'package:machine_test/view/screens/home_screen.dart';
import 'package:machine_test/view/screens/login_screen.dart';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/product_model.dart';
class LoginController extends GetxController{
  List<ProductModel>? products;
userLogin(String email, String password) async { 
    if (email == "mor_2314" && password == "83r5^_") {
      final sharedPref = await SharedPreferences.getInstance();
      await sharedPref.setString("email", email);
      Map<String, dynamic> loginData = {
        "username": "mor_2314",
        "password": "83r5^_"
      };
      final response = await ApiService().login(loginData);
      try {
        if(response!.statusCode == 200 || response.statusCode == 201) {
          final login = loginModelFromJson(response.data);
          if(login.token != null) {
            Get.off(HomeScreen());
            Get.snackbar(
              'Successful', 
              'User loggedin Successfully',
              duration: const Duration(seconds: 4),
            snackPosition: SnackPosition.BOTTOM,
            );
            update();
          }
        }
        else {
          Get.snackbar('Failed', 'Loggedin failed',
          duration: const Duration(seconds: 4),
          snackPosition: SnackPosition.BOTTOM,
          );
          update();
        }
      } catch (e) {
        Get.snackbar('Failed', 'Loggedin failed',
          duration: const Duration(seconds: 4),
          snackPosition: SnackPosition.BOTTOM,
          );
        log(e.toString());
      }
    }
    update();
}

 Future<void> validateuser() async {
    log("villichu");
    final sharedPref = await SharedPreferences.getInstance();

    var email = sharedPref.getString("email");
    if (email != null) {
      Get.to(() => HomeScreen());
    } else {
      Get.to(LoginScreen());
    }
    update();
  }

  //signout function
  clearUser() async {
    final sharedpref = await SharedPreferences.getInstance();
    sharedpref.clear();
    Get.offAll(LoginScreen());
    Get.snackbar(
      duration: const Duration(seconds: 3),
      'Logout Successfull',
      'User has logged out Successfully',
      snackPosition: SnackPosition.BOTTOM,
    );
    update();
  }
   

  getData() async {
    try {
      final response = await ApiService().getProductList();
      // log(response.toString());
      if (response!.statusCode == 200 || response.statusCode == 201) {
        final list = productModelFromJson(response.data);
        products = list.obs;
        log(products.toString());
        update();
      }
    } catch (e) {
      

      update();
    }
  }
@override
  void onInit() {
    getData();
    super.onInit();
    update();
  }

}