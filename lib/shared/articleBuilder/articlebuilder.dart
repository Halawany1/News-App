import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/shared/Seperator/Shared_Seperator.dart';

import '../BuildBusinessitem/BuildBusinessItem.dart';

Widget ArticleBuilder(list,context,{bool isPageview=false}){
  return  ConditionalBuilder(
    condition: list.length>0,
    builder: (context) {
      return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              BusinessItem(article: list[index],context: context),
          separatorBuilder: (context, index) => SharedSeperator(),
          itemCount: list.length);
    },
    fallback: (context) {
      return isPageview ?Container():Center(child: CircularProgressIndicator());
    },);
}