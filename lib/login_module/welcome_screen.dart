import 'package:api_ui_test_project/helper/routes/routes.dart';
import 'package:api_ui_test_project/login_module/loginController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class WelcomeScreen extends StatelessWidget {
   WelcomeScreen({Key? key}) : super(key: key);
   TextEditingController nameController = TextEditingController();
   TextEditingController emailController = TextEditingController();
   LoginController controller=Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: WillPopScope(
         onWillPop: ()async {
           Get.offAllNamed(Routes.login);
           return true;
         },
         child: SafeArea(
           child: Container(
             padding: EdgeInsets.only(left: 20,right: 20),
             margin: EdgeInsets.only(top: 60),
             child: Column(

               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                  Text("Welcome",style: TextStyle(
                     fontSize: 20,fontWeight: FontWeight.w500
                  ),),
                 const Padding(
                   padding: EdgeInsets.only(top:10.0,bottom: 20),
                   child: Text("Looks like you are new here.Tell us bit about yourself",style: TextStyle(
                       fontSize: 16,fontWeight: FontWeight.w500
                   )),
                 ),
                 Container(
                   margin:EdgeInsets.only(top: 10,bottom: 20),
                   height: 60,
                   width: Get.width,
                   decoration: BoxDecoration(
                     color: context.theme.cardColor,
                     // borderRadius: BorderRadius.all(Radius.circular(12)),
                     border: Border.all(color: Colors.black.withOpacity(0.2),width: 1.5),
                   ),
                   child: TextFormField(
                     controller: nameController,
                     textAlign: TextAlign.center,
                     style:const  TextStyle(
                         color: Colors.black,
                         fontWeight: FontWeight.w500,
                         fontSize: 16
                     ),
                     textInputAction: TextInputAction.done,
                     keyboardType: TextInputType.name,
                     maxLines: 1,
                     inputFormatters: [
                       LengthLimitingTextInputFormatter(12)
                     ],
                     decoration: InputDecoration(
                       hintText: "Name",
                       hintStyle:context.textTheme.bodySmall?.copyWith(
                           fontWeight: FontWeight.w500, fontSize: 16),
                       border: const OutlineInputBorder(
                         borderSide: BorderSide.none,
                       ),),
                   ),
                 ),
                 Container(
                   margin:EdgeInsets.only(top: 10),
                   height: 60,
                   width: Get.width,
                   decoration: BoxDecoration(
                     color: context.theme.cardColor,
                     // borderRadius: BorderRadius.all(Radius.circular(12)),
                     border: Border.all(color: Colors.black.withOpacity(0.2),width: 1.5),
                   ),
                   child: TextFormField(
                     controller: emailController,
                     textAlign: TextAlign.center,
                     style:const  TextStyle(
                         color: Colors.black,
                         fontWeight: FontWeight.w500,
                         fontSize: 16
                     ),
                     textInputAction: TextInputAction.done,
                     keyboardType: TextInputType.emailAddress,
                     maxLines: 1,
                     inputFormatters: [
                       LengthLimitingTextInputFormatter(40)
                     ],
                     decoration: InputDecoration(
                       hintText: "Email",
                       hintStyle:context.textTheme.bodySmall?.copyWith(
                           fontWeight: FontWeight.w500, fontSize: 16),
                       border: const OutlineInputBorder(
                         borderSide: BorderSide.none,
                       ),),
                   ),
                 ),

                 InkWell(
                   onTap: (){
                     // Get.toNamed(Routes.home);
                     controller.addDetails(nameController.text, emailController.text);
                   },
                   child: Container(
                     width: MediaQuery.of(context).size.width,
                     decoration: BoxDecoration(
                       borderRadius:BorderRadius.circular(5),
                         color: Colors.blue
                     ),
                     margin:const EdgeInsets.symmetric(horizontal:10,vertical: 20),
                     padding:const  EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                     child:const Text("Submit",textAlign: TextAlign.center,style:TextStyle(
                       color: Colors.white
                     ),),
                   ),
                 )
               ],
             ),
           ),
         ),
       ),
    );
  }
}
