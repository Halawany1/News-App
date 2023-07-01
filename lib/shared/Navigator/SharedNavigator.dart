import 'package:flutter/cupertino.dart';

Future SharedNavigator (context,Widget){
  return Navigator.push(context,
      PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation)
      => Widget,));
}