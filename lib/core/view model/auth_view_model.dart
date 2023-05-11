import 'package:e_commerce/core/service/firestore_user.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:e_commerce/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthViewModel extends GetxController {
//var counter = 0.obs ;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookAuth _facebookLogin = FacebookAuth.instance;

  late String email, password, name;
  Rxn<User> _user = Rxn<User>();

  String? get user => _user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication? googleSignInAuthantication =
        await googleUser?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthantication?.idToken,
      accessToken: googleSignInAuthantication?.accessToken,
    );
    await _auth.signInWithCredential(credential).then((user){saveUser(user);});
    Get.offAll(() => HomeView());
  }

  void FacebookSignInMethod() async {
    final Result = await _facebookLogin.login(permissions: ['email']);
    final accessToken = Result.accessToken!.token;
    if (Result.status == LoginStatus.success) {
      final faceCredential = FacebookAuthProvider.credential(accessToken);
      await _auth.signInWithCredential(faceCredential);

      await _facebookLogin.getUserData().then((userData) async {
        await _auth.currentUser!.updateEmail(userData['email']).then((user){});
      });
      return null;
    } else if (Result.status == LoginStatus.cancelled) {
      print('Login cancelled');
    } else {
      print('Error');
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((user)async{
        saveUser(user);
      });
      Get.offAll(() => HomeView());
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        'Error login account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> createAccountWithEmailAndPass() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async{
        saveUser(user);
      });

      Get.offAll(() => HomeView());
    } on FirebaseAuthException catch (e) {
      print(e.message);
      Get.snackbar('Error login account', e.message.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }
  void saveUser(UserCredential user) async{
    if(name == ""){
      await FirestroreUser().addUserToFireStore(UserModel(
        user.user!.uid,
        user.user!.email.toString(),
        user.user!.displayName.toString(),
        '',
      ));
    }
    else{
      await FirestroreUser().addUserToFireStore(UserModel(
        user.user!.uid,
        user.user!.email.toString(),
        name,
        '',
      ));
    }


}
}
