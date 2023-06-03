import 'package:api_ui_test_project/helper/routes/routes.dart';
import 'package:api_ui_test_project/login_module/loginController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatelessWidget {

  String phoneNumber;
 final controller=Get.put(LoginController());
   VerificationScreen({required this.phoneNumber,Key? key}) : super(key: key);

   TextEditingController  verifyController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: ()async {
         Get.back();
          return true;
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/flutterimages.png",height: 50,width: 50,),
            const Padding(
              padding:EdgeInsets.only(left: 20,top: 10),
              child: Text("Enter OTP",style: TextStyle(
                  fontSize: 20,fontWeight:FontWeight.w700
              ),),
            ),
             Padding(
              padding:const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
              child: Text("OTP has been sent to +91 ${phoneNumber}",style: const TextStyle(
                  fontSize: 14,fontWeight:FontWeight.w600
              ),),
            ),
            Container(

              padding: const EdgeInsets.only(left: 20,top: 5,right: 20),
              alignment: Alignment.center,
              child: PinCodeTextField(
                autoDisposeControllers: false,
                appContext: Get.context!,
                controller: verifyController,
                keyboardType: TextInputType.phone,
                hintCharacter: "-",
                hintStyle: const TextStyle(
                    fontSize: 30, fontWeight: FontWeight.w600,
                    color: Colors.grey
                ),
                length: 6,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  borderWidth: 1,
                  activeFillColor: Colors.white,
                  activeColor: Colors.black,
                  inactiveFillColor: Colors.white,
                   shape: PinCodeFieldShape.box,
                  inactiveColor: Colors.black,
                  selectedColor: Colors.black,
                  selectedFillColor: Colors.white,
                  fieldHeight: 50,
                  fieldWidth: 50,
                ),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: false,
                beforeTextPaste: (text) {
                  return true;
                }, onChanged: (String value) {},
              ),
            ),
            InkWell(
              onTap: ()
              {
                // controller.googleLogin();
                // Get.toNamed(Routes.welcome);
                controller.verifyOtp(verifyController.text);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin:const  EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                padding:const  EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                child:const Text("Verify",textAlign: TextAlign.center,style: TextStyle(
                  color: Colors.white,fontSize: 14
                ),),
              ),
            ),


            InkWell(
              onTap: ()
              {
                Get.back();
              },
              child: Container(
                width: MediaQuery.of(context).size.width,

                margin:const  EdgeInsets.symmetric(horizontal: 30),
                padding:const  EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                child:const Text("Retry",textAlign: TextAlign.center,style: TextStyle(fontSize: 14
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
