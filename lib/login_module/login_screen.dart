
import 'package:api_ui_test_project/helper/routes/routes.dart';
import 'package:api_ui_test_project/login_module/loginController.dart';
import 'package:ccp_dialog/country_picker/flutter_country_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
class LoginScreen extends StatelessWidget {

   LoginScreen({Key? key}) : super(key: key);
   LoginController controller=Get.put(LoginController());
  TextEditingController phoneNumberController=TextEditingController();
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
               child: Text("Get Started",style: TextStyle(
                 fontSize: 20,fontWeight:FontWeight.w700
               ),),
             ),

             Container(
               margin:EdgeInsets.only(top: 10,left: 20,right: 20),
               height: 60,
               width: Get.width,
               decoration: BoxDecoration(
                 color: context.theme.cardColor,
                 borderRadius: BorderRadius.all(Radius.circular(12)),border: Border.all(color: Colors.black.withOpacity(0.2),width: 1.5),
               ),
               child: Row(
                 children: [
                   Padding(
                     padding:  EdgeInsets.only(left: 10),
                     child: Obx(()=>
                       CountryPicker(
                           selectedCountry: controller.selectedCountry.value,
                           dense: false,
                           showFlag: false,
                           showLine: true,

                           //displays flag, true by default
                           showDialingCode: true,
                           //displays dialing code, false by default
                           showName: false,
                           withBottomSheet: false,
                           onChanged:controller.updateCountry
                       ),
                     ),
                   ),
                   Flexible(
                     child: TextFormField(
                       controller: phoneNumberController,
                       textAlign: TextAlign.center,
                       style:const  TextStyle(
                           color: Colors.black,
                           fontWeight: FontWeight.w500,
                           fontSize: 13
                       ),
                       textInputAction: TextInputAction.done,
                       keyboardType: TextInputType.phone,
                       maxLines: 1,
                       inputFormatters: [
                         LengthLimitingTextInputFormatter(12)
                       ],
                       decoration: InputDecoration(
                         hintText: "Mobile No.",

                         //contentPadding: EdgeInsets.only(left:10,top: 20),
                         hintStyle:context.textTheme.bodySmall?.copyWith(
                             fontWeight: FontWeight.w500,
                             fontSize: 13),
                         border: const OutlineInputBorder(
                           borderSide: BorderSide.none,
                         ),),
                     ),
                   ),
                 ],
               ),
             ),




             InkWell(
               onTap: (){
                // controller.googleLogin();
                //  Get.toNamed(Routes.verification);
                 controller.signIn(phoneNumberController.text);
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
