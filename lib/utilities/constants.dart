import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

const kLigthBoxShadow = [
  BoxShadow(
    color: Colors.white,
    spreadRadius: 1,
    blurRadius: 15,
    offset: Offset(-4, -4),
  ),
  BoxShadow(
    color: Colors.grey,
    spreadRadius: 1,
    blurRadius: 15,
    offset: Offset(4, 4),
  ),
];

CollectionReference posts = FirebaseFirestore.instance.collection('posts');
