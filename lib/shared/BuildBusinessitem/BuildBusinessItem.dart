import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/News%20App/Cubit/NewsCubit.dart';
import 'package:untitled/layout/News%20App/Cubit/NewsState.dart';
import 'package:untitled/modules/Web_View/web_view.dart';
import 'package:untitled/shared/Navigator/SharedNavigator.dart';

Widget BusinessItem({ required article,required context,required int index}){
  return  BlocConsumer<NewsCubit,NewsState>(
  listener: (context, state) {

  },
    builder: (context, state) {
    var cubit=context.read<NewsCubit>();
      return  InkWell(
        onTap: () {
          if(!cubit.isDesktop)
            SharedNavigator(context, WebViewScreen(article['url']));
          else
            cubit.ChangeSelectItem(index);
        },
        child: Container(
          color: cubit.selectedItem==index&&cubit.isDesktop?Colors.grey[200]:null,
          child: Padding(
            padding:  EdgeInsets.all(12.0),
            child: Row(
              children: [
                Container(
                  width: 130,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage('${article['urlToImage']}'),
                          fit: BoxFit.cover
                      )

                  ),
                ),
                SizedBox(width: 15,),
                Expanded(child: Container(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 7,),
                      Expanded(
                        child: Text("${article['title']}",
                          style: Theme.of(context).textTheme.bodyText1,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,),
                      ),
                      Text('${article['publishedAt']}',
                        style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      );
    },
  );
}