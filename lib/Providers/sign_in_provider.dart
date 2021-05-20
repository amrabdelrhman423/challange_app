import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInProvider extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  String error = "";
  bool isloging = false;
  final FacebookLogin facebookSignIn = new FacebookLogin();

  SignInProvider() {
    isloging = false;
  }
  signIn(String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
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

  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    await _auth.signInWithCredential(credential).then((value) {
      if (_auth.currentUser.uid.isNotEmpty) {
        isloging = true;
      }
    });
    notifyListeners();
  }

  Future<void> singWithFacebook() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        final AccessToken firebaseresult = await FacebookAuth.instance.login();
        // Create a credential from the access token
        final facebookAuthCredential =
            FacebookAuthProvider.credential(firebaseresult.token);
        await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential)
            .then((value) {
          if (_auth.currentUser.uid.isNotEmpty) {
            isloging = true;
          }
        });
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        print('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
    notifyListeners();
  }
}
