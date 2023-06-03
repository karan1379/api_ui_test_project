import 'dart:convert';

import 'package:api_ui_test_project/api_constants.dart';
import 'package:api_ui_test_project/helper/routes/routes.dart';
import 'package:api_ui_test_project/helper/shared_prefrence_helper.dart';
import 'package:api_ui_test_project/helper/utils.dart';
import 'package:api_ui_test_project/model/user_model.dart';
import 'package:ccp_dialog/country_picker/country.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

   late SharedPreferenceHelper preferenceHelper;
   Rx<Country> selectedCountry = Country.IN.obs;
   var countryCode = "+91".obs;
   Dio dio = Dio();
   final userModel = Rxn<UserModel>();

   @override
  void onInit() {
    // TODO: implement onInit
    preferenceHelper=SharedPreferenceHelper();
     super.onInit();
  }

   updateCountry(Country country)
   {
     selectedCountry.value = country;
     countryCode.value = "+" + country.dialingCode.toString();
   }


   Future<UserModel?> signIn(String phoneNumber) async {
     try {
       Utils.showLoader();
       var response = await dio.get(ApiConstants.signIn,
         data: {"mobile": phoneNumber,},);
       Utils.hideLoader();
       if (response.statusCode == 200) {
         userModel.value=UserModel.fromJson(jsonDecode(response.data));
         // userModel.value?.status;
         preferenceHelper.saveRequestId(userModel.value?.request_id);
         Get.toNamed(Routes.verification,arguments: phoneNumber);
       } else {
         Get.showSnackbar(const GetSnackBar(message: "Error",));
       }
     } catch (e) {
       print(e.toString());
     }
     return null;
   }

   Future<UserModel?> verifyOtp(String otp) async {
     try {
       Utils.showLoader();
       var response = await dio.post(ApiConstants.verifyOTP,
         data: {"request_id": preferenceHelper.getRequestId(),"code":otp},);
      Utils.hideLoader();
       if (response.statusCode == 200) {
         userModel.value=UserModel.fromJson(jsonDecode(response.data));
         if(userModel.value?.profile_exists==true){
           Get.toNamed(Routes.home);
         }
         else {
           Get.toNamed(Routes.welcome);
         }
         } else {
         Get.showSnackbar(const GetSnackBar(message: "Error",));
       }
     } catch (e) {
       print(e.toString());
     }
     return null;
   }

   Future<UserModel?> addDetails(String name,String email) async {
     try {
       Utils.showLoader();
       var response = await dio.get(ApiConstants.verifyOTP,
         data: {"name": name,"email":email},

           options: Options(
             headers: {
               'Token': 'jwt1235',
             },
           ));
       Utils.hideLoader();
       if (response.statusCode == 200) {
         // userModel.value=UserModel.fromJson(jsonDecode(response.data));
         Get.toNamed(Routes.home);
       } else {
         Get.showSnackbar(const GetSnackBar(message: "Error",));
       }
     } catch (e) {
       print(e.toString());
     }
     return null;
   }




}