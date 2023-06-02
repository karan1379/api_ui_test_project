import 'package:api_ui_test_project/helper/routes/routes.dart';
import 'package:api_ui_test_project/login_module/loginController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatelessWidget {

 final controller=Get.put(LoginController());
   VerificationScreen({Key? key}) : super(key: key);

   TextEditingController  verifyController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/flutterimages.png",height: 50,width: 50,),
          const Padding(
            padding:EdgeInsets.symmetric(horizontal: 20),
            child: Text("Enter OTP",style: TextStyle(
                fontSize: 20,fontWeight:FontWeight.w700
            ),),
          ),
          const Padding(
            padding:EdgeInsets.symmetric(horizontal: 20),
            child: Text("OTP has been sent to +91 -number",style: TextStyle(
                fontSize: 14,fontWeight:FontWeight.w600
            ),),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(25),),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
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

                borderRadius: BorderRadius.circular(10),
                fieldHeight: 50,
                fieldWidth: 40,
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
              decoration:const BoxDecoration(
                  color: Colors.blue
              ),
              margin:const  EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              padding:const  EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child:const Text("Confirm",textAlign: TextAlign.center,),
            ),
          )
        ],
      ),
    );
  }
}
