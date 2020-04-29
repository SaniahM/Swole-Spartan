import 'package:cloud_firestore/cloud_firestore.dart';

class User{

  final String uid;
  User({this.uid});

}

class DatabaseService{

  //collection reference

  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userRecords = Firestore.instance.collection('user_records');

  Future updateUserData(String fName, String lName, String address, String phone, String email) async{
    
    return await userRecords.document(uid).setData({

      'first_name': fName,
      'last_name' : lName,
      'address' : address,
      'phone' : phone,
      'email' : email,

    });

  }

UserData _datalist(DocumentSnapshot doc){

    return UserData(
      uid: uid,
      firstName: doc.data['first_name'],
      lastName: doc.data['last_name'],
      address: doc.data['address'],
      phone: doc.data['phone'],
      email: doc.data['email'],
    );

  }






  // Stream<List<UserData>> get userInfo{

  // return userRecords.snapshots()
  // .map(_datalist);
 
  // }
  
  Stream<UserData> get userData{

    return userRecords.document(uid).snapshots().map(_datalist);

  } 



}


class UserData{

  String uid;
  String firstName;
  String lastName;
  String address;
  String phone;
  String email;

  UserData({this.uid,this.firstName, this.lastName, this.address, this.phone, this.email});

}