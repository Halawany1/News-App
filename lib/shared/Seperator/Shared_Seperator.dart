import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget SharedSeperator(){
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(
      width: double.infinity,
      height: 2,
      color: Colors.grey,
    ),
  );
}