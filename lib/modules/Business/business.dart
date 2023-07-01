import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/News%20App/Cubit/NewsCubit.dart';
import 'package:untitled/layout/News%20App/Cubit/NewsState.dart';
import 'package:untitled/shared/BuildBusinessitem/BuildBusinessItem.dart';

import '../../shared/articleBuilder/articlebuilder.dart';

class Business extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>
      (builder: (context, state) {
        List list=NewsCubit.get(context).business;
        return  ArticleBuilder(list,context);
    },
        listener: (context, state) {

        },);
}
}