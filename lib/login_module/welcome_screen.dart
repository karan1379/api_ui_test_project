import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class WelcomeScreen extends StatelessWidget {

   WelcomeScreen({Key? key}) : super(key: key);

   TextEditingController nameController = TextEditingController();
   TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
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
                 padding: EdgeInsets.only(top:10.0),
                 child: Text("Looks like you are new here.Tell us bit about yourself",style: TextStyle(
                     fontSize: 16,fontWeight: FontWeight.w500
                 )),
               ),
               Container(
                 margin:EdgeInsets.only(top: 10),
                 height: 60,
                 width: Get.width,
                 decoration: BoxDecoration(
                   color: context.theme.cardColor,
                   borderRadius: BorderRadius.all(Radius.circular(12)),border: Border.all(color: Colors.black.withOpacity(0.2),width: 1.5),
                 ),
                 child: TextFormField(
                   controller: nameController,
                   textAlign: TextAlign.center,
                   style:const  TextStyle(
                       color: Colors.black,
                       fontWeight: FontWeight.w500,
                       fontSize: 13
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
                         fontWeight: FontWeight.w500, fontSize: 13),
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
                   borderRadius: BorderRadius.all(Radius.circular(12)),border: Border.all(color: Colors.black.withOpacity(0.2),width: 1.5),
                 ),
                 child: TextFormField(
                   controller: emailController,
                   textAlign: TextAlign.center,
                   style:const  TextStyle(
                       color: Colors.black,
                       fontWeight: FontWeight.w500,
                       fontSize: 13
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
                         fontWeight: FontWeight.w500, fontSize: 13),
                     border: const OutlineInputBorder(
                       borderSide: BorderSide.none,
                     ),),
                 ),
               ),
             ],
           ),
         ),
       ),
    );
  }
}
