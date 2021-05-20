import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SignUpProvider extends ChangeNotifier {
  bool checkBoxValue = false;
  final _auth = FirebaseAuth.instance;
  String error = "";
  bool isloging = false;

  SignUpProvider() {
    isloging = false;
  }

  void changeCheckBox(bool newValue) {
    checkBoxValue = newValue;
    notifyListeners();
  }

  signUp(String email, String password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        if (_auth.currentUser.uid.isNotEmpty) {
          isloging = true;
        }
      });
    } on FirebaseAuthException catch (e) {
      error = e.message;
    } catch (e) {
      isloging = false;
    }
    notifyListeners();
  }
}
