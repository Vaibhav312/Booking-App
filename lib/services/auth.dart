import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/models/user.dart';
import 'package:first_app/services/database.dart';

class AuthService{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  String data='';

  //create user object based on FireBaseUser
  User userFromFirebaseUser(FirebaseUser user){
    //print(user.email);
    data=user.email;
    return user !=null ? User(uid: user.uid,email : user.email) : null;
  }

  //auth change user stream

  Stream<User> get user{
    return _auth.onAuthStateChanged
        .map(userFromFirebaseUser);
  }



  //sign in with email & password
  Future signWithEmailAndPasssword(String email,String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user=result.user;

      return userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
    }
  }
  //register
  Future registerEmailAndPassword(String email,String password,String name) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user=result.user;

      await DatabaseService(uid: user.uid).updateUserData('Empty List');


      UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
      userUpdateInfo.displayName = name;
      user.updateProfile(userUpdateInfo);
      return userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future userSignOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}