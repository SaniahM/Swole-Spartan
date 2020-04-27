import 'package:firebase_auth/firebase_auth.dart';
import 'user.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object
  User _user(FirebaseUser user){
    return user != null ? User(uid:user.uid): null;
  }  

  // divert user stream

  Stream<User> get user{
    return _auth.onAuthStateChanged.map(_user);
  }


  //guest sign-in
  Future guestSignin() async{
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _user(user);

    }catch(e){
      print(e.toString());
      return null;

    }

  }


  //official signup
  Future signUp(String email, String password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _user(user);

    }catch(e){
      print(e.toString());
      return null;

    }
  }

  //login

  Future logIn(String email, String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _user(user);

    }catch(e){
      print(e.toString());
      return null;

    }
  }

  Future signOut() async{
    try{

      return await _auth.signOut();

    }catch(e){
      print(e.toString());
      return null;
    }

  }

}