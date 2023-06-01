import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationScreen extends StatelessWidget {
   VerificationScreen({Key? key}) : super(key: key);

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
          InkWell(
            onTap: ()
            {
              // controller.googleLogin();
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
