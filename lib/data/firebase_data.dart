// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseData {
  static final foodDeteil = FirebaseFirestore.instance.collection('foodDeteil');
  static final profile = FirebaseFirestore.instance.collection('profile');
 static final firebaseUser = FirebaseAuth.instance;

  static final informationAboutUser =
      FirebaseFirestore.instance.collection('informationAboutUser');

 
}

class UserModel {
  final String name;
  final String id;
  final String phone;
  final String email;
  final String password;

  UserModel(
      {required this.name,
      required this.id,
      required this.phone,
      required this.email,
      required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'phone': phone,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      id: map['id'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
