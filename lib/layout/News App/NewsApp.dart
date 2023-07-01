import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/News%20App/Cubit/NewsCubit.dart';
import 'package:untitled/modules/Search_Screen/Search.dart';
import 'package:untitled/shared/Network/remote/dio_helper.dart';

import '../../shared/Navigator/SharedNavigator.dart';
import 'Cubit/NewsState.dart';

class NewsApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(

      listener: (context, state) {
      },
      builder: (context, state) {
        NewsCubit cubit=NewsCubit.get(context);
        return  Scaffold(
          body: cubit.ScreenItem[cubit.currentIndex],
          appBar: AppBar(
            title: Text("News App"),
            actions: [IconButton(onPressed: () {
              SharedNavigator(context,SearchScreen());
            },icon: Icon(Icons.search)),
              IconButton(onPressed: () {
                NewsCubit.get(context).ChangeMode();
              },
                  icon: Icon(Icons.brightness_4_outlined))
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              cubit.ChangeBottomNavBar(value);
            },
            currentIndex: cubit.currentIndex,
            items:cubit.BottomItem ,
          ),
        );
      },
    );
  }
}