import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/News%20App/Cubit/NewsCubit.dart';
import 'package:untitled/layout/News%20App/Cubit/NewsState.dart';
import 'package:untitled/shared/Navigator/SharedNavigator.dart';
import 'package:untitled/shared/articleBuilder/articlebuilder.dart';
import 'package:untitled/shared/sharedformfield/defualtformfield.dart';

class SearchScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var SearchController=TextEditingController();
    return BlocConsumer<NewsCubit,NewsState>(
     builder: (context, state) {
      var list =NewsCubit.get(context).search;
       return Scaffold(
         appBar: AppBar(),
         body: Column(
           children: [
             Padding(
               padding:  EdgeInsets.all(20.0),
               child: defaultformfield(controller: SearchController,
                 type: TextInputType.text,
                 labeltext: "Search",
                 onchange:(String value) {
                 NewsCubit.get(context).GetSearch(value);
                 },
                 validator: (value) {
                   if(value!.isEmpty){
                     return "search must not be empty";
                   }
                   return null;
                 },
               ),
             ),
             Expanded(child: ArticleBuilder(list, context,isPageview: true))
           ],
         ),
       );
     },
      listener: (context, state) {

      },
    );
  }
}