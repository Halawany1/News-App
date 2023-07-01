import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/shared/articleBuilder/articlebuilder.dart';

import '../../layout/News App/Cubit/NewsCubit.dart';
import '../../layout/News App/Cubit/NewsState.dart';
import '../../shared/BuildBusinessitem/BuildBusinessItem.dart';

class Sports extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>
      (builder: (context, state) {
      List list=NewsCubit.get(context).sports;
      return ArticleBuilder(list,context);
    },
      listener: (context, state) {

      },);
  }
}