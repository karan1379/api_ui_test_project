
import 'package:api_ui_test_project/helper/shared_prefrence_helper.dart';
import 'package:ccp_dialog/country_picker/country.dart';
import 'package:get/get.dart';


class LoginController extends GetxController{

   late SharedPreferenceHelper preferenceHelper;
   Rx<Country> selectedCountry = Country.IN.obs;
   var countryCode = "+91".obs;

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


  /*Future<void> googleLogin() async {
     GoogleSignIn _googleSignIn = GoogleSignIn();
     try {
       var alreadySign = await _googleSignIn.isSignedIn();
       // debugPrint("already sign $alreadySign");
       if(alreadySign){
         await _googleSignIn.signOut();
         googleLogin();
       }else{
         var result = await _googleSignIn.signIn();
         print(result!.displayName);
         print(result.email);
         print(result.photoUrl);
         if (result != null)
         {
           // loginController.socialLogin(result.id, "google", result.email, result.displayName.toString(), "jhh");
           Get.offAllNamed(Routes.home);
           preferenceHelper.saveUserName(result.displayName.toString());
           preferenceHelper.saveIsLoggedIn(true);

         }
       }
     } catch (error) {
       print(error);
     }
   }*/


}