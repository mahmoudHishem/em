import 'package:em/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthControlles extends GetxController{
  bool isVisibility =false;
  bool isCheckBox =false;
  var displayUserName = ''.obs;
  var displayUserPhoto = ''.obs;
  var displayUserEmail = ''.obs;
  FirebaseAuth auth=FirebaseAuth.instance;
  var googleSignIn = GoogleSignIn();

  var isSignedIn =false;
  final GetStorage authBox =GetStorage();
  User ?get userProfile =>auth.currentUser;
  @override
  void onInit() {
    displayUserName.value=
    (userProfile !=null ? userProfile!.displayName:"")!;
   displayUserPhoto.value=
    (userProfile !=null ? userProfile!.photoURL:"")!;
    displayUserEmail.value=
    (userProfile !=null ? userProfile!.email:"")!;
    super.onInit();
  }


  void visibility(){
    isVisibility =!isVisibility;

    update();
  }
  void checkBox(){
    isCheckBox =! isCheckBox;
    update();
  }
  void signUpUsingFirebase(
  {required String name,
    required String email,
    required String password,
  }
      )
  async{
    try {
       await  auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
      ).then((value) {
        displayUserName.value= name;
        auth.currentUser!.updateDisplayName(name);

       });



      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title =error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message ='';


    if (error.code == 'weak-password') {

        message ='The password provided is too weak.';
      } else if (error.code == 'email-already-in-use') {
        message='The account already exists for that email.';
      } else{
      message=error.message.toString();
    }

    Get.snackbar(title, message,snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,colorText: Colors.black);
    } catch (e) {
      Get.snackbar('error!','error.toString()',
          snackPosition: SnackPosition.
          BOTTOM,backgroundColor: Colors.black,colorText: Colors.white , );
      print(e);
    }

  }
  void logInUsingFirebase({
    required String email,
    required String password,

  })async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
      ).then((value) => displayUserName.value =auth.currentUser!.displayName!);
      isSignedIn =true;
      authBox.write("auth", isSignedIn);
      update();
      Get.offNamed(Routes.mainScreen);

    } on FirebaseAuthException catch (error) {
      String title =error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message ='';


      if (error.code == 'user-not-found') {
        message= 'Account does not exists for that$email.. Create your account by signing up..';
      } else if (error.code == 'wrong-password') {
        message= 'Invalid password..Please try again!';

      }else{
        message= error.message.toString();
      }
      Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.green);
    }catch (e) {
      Get.snackbar('error!','error.toString()',
        snackPosition: SnackPosition.
        BOTTOM,backgroundColor: Colors.black,colorText: Colors.white , );
      print(e);
    }
  }

  void facbookSignApp(){}
  void googleSignInApp()async{
    try{
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      displayUserName.value=googleUser!.displayName!;
      displayUserPhoto.value=googleUser.photoUrl!;
      displayUserEmail.value=googleUser.email;
      GoogleSignInAuthentication googleSignInAuthentication=
      await googleUser.authentication;
      final AuthCredential credential =GoogleAuthProvider.credential(
        idToken:googleSignInAuthentication.idToken,
        accessToken:googleSignInAuthentication.accessToken,

      );

await auth.signInWithCredential(credential);
      isSignedIn =true;
      authBox.write("auth", isSignedIn);
      isSignedIn =true;

      update();

      Get.offNamed(Routes.mainScreen);
    }catch
    (error){
      Get.snackbar('error!',error.toString(),
      snackPosition: SnackPosition.
      BOTTOM,backgroundColor: Colors.black,colorText: Colors.white , );
    }

  }
  void restPassword(String email)async{
    try {
    await auth.sendPasswordResetEmail(email: email);
    update();
    Get.back();
  } on FirebaseAuthException catch (error) {
    String title =error.code.replaceAll(RegExp('-'), ' ').capitalize!;
    String message ='';


    if (error.code == 'user-not-found') {
      message= 'Account does not exists for that$email.. Create your account by signing up..';
    } else{
      message= error.message.toString();
    }
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.green);
  }catch (e) {
    Get.snackbar('error!','error.toString()',
      snackPosition: SnackPosition.
      BOTTOM,backgroundColor: Colors.black,colorText: Colors.white , );
    print(e);
  }}
  void signOutFromApp()async{
    try {
      await auth.signOut();
      await  googleSignIn.signOut();
      displayUserName.value= '' ;
      displayUserPhoto.value= '' ;
      isSignedIn =false;
      authBox.remove("auth");

      update();
      Get.offNamed(Routes.wellcomeScreen);

    }
        catch(error){
      Get.snackbar("Error",
          error.toString(),
          snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white);
        }
  }



}