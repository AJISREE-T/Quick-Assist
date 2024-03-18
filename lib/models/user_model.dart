import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String? name;
  String? email;
  String? password;
  String? address;
  String? phone;
  String? role;
  int? status ;
  String? uid;


  UserModel({this.password,this.email,this.status,this.role,this.name,this.phone,this.address,this.uid});

  factory UserModel.fromJson(DocumentSnapshot data){
    return UserModel(
      email: data['email'],
      uid: data['uid'],
      name: data['name'],
      role: data['role'],
      address: data['address'],
      phone: data['phone'],
      status: data['status'],
    );

  }

  Map<String,dynamic>toJson(){
    return{
      "uid":uid,
      "name":name,
      "email":email,
      "address":address,
      "phone":phone,
      "status":status,
    };


  }


}



// class ShopModel{
//   String? name;
//   String? email;
//   String? password;
//   String? address;
//   String? phone;
//   String? role;
//   int? status ;
//   String? uid;
//
//
//   UserModel({this.password,this.email,this.status,this.role,this.name,this.phone,this.address,this.uid});
//
//   factory UserModel.fromJson(DocumentSnapshot data){
//     return UserModel(
//       email: data['email'],
//       uid: data['uid'],
//       name: data['name'],
//       role: data['role'],
//       address: data['address'],
//       phone: data['phone'],
//       status: data['status'],
//     );
//
//   }
//
//   Map<String,dynamic>toJson(){
//     return{
//       "uid":uid,
//       "name":name,
//       "email":email,
//       "address":address,
//       "phone":phone,
//       "status":status,
//     };
//
//
//   }
//
//
// }