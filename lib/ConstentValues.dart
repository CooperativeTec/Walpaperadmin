import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
FirebaseAuth mAth = FirebaseAuth.instance;
// var storage = Firebase.storage();
FirebaseFirestore db = FirebaseFirestore.instance;
FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
var allTabs=[
  {
    "tabno":"Live",
    'check':true
  },
  {
    "tabno":"custompaper",
    'check':false
  },
  {
    "tabno":"Home",
    'check':false
  },
  {
    "tabno":"3D",
    'check':false
  },
  {
    "tabno":"Double",
    'check':false
  },
  {
    "tabno":"Xmap",
    'check':false
  },
  {
    "tabno":"new",
    'check':false
  }
];
