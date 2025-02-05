import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> registerNewUser(String email, String fullName, String password,
      String confirmPassword) async {
    String result = 'Something went wrong';
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await _firestore.collection('buyers').doc(userCredential.user!.uid).set({
        'fullName': fullName,
        'profileImage': '',
        'email': email,
        'uid': userCredential.user!.uid,
        'pinCode ': "",
        'locality': "",
        'city': '',
        'state': '',
      });

      result = 'success';
    } catch (e) {
      result = e.toString();
    }
    return result;
  }

  Future<String> loginUser(String email, String password) async {
    String result = 'Something went wrong';
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      result = "success";
    } catch (e) {
      result = e.toString();
    }

    return result;
  }
}
