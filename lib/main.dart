import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/layout/News%20App/Cubit/NewsCubit.dart';
import 'package:untitled/layout/News%20App/NewsApp.dart';
import 'package:untitled/shared/Network/local/CacheHelper.dart';
import 'package:untitled/shared/Network/remote/dio_helper.dart';
import 'package:untitled/shared/bloc_observer.dart';
import 'layout/News App/Cubit/NewsState.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark =  await CacheHelper.getBoolean(key:'IsDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget{
  final bool isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..GetBusiness()..GetScience()..GetSports()
      ..ChangeMode(FromShared: isDark),
    child:  BlocConsumer<NewsCubit,NewsState>(
     builder: (context, state) {
       return  MaterialApp(
         home: Directionality(
             textDirection: TextDirection.ltr,
             child: NewsApp()),
         debugShowCheckedModeBanner: false,
         theme: ThemeData(
             textTheme: TextTheme(
                 bodyText1: TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.bold,
                     color: Colors.black
                 )
             ),
             primarySwatch: Colors.deepOrange,
             scaffoldBackgroundColor: Colors.white,
             appBarTheme: AppBarTheme(
                 titleSpacing: 20,
                 systemOverlayStyle: SystemUiOverlayStyle(
                     statusBarColor: Colors.white,
                     statusBarIconBrightness: Brightness.dark
                 ),
                 backgroundColor: Colors.transparent,
                 elevation: 0,
                 titleTextStyle: TextStyle(color: Colors.black,
                     fontSize: 20,fontWeight: FontWeight.bold),
                 iconTheme: IconThemeData(color: Colors.black,size: 30)
             ),
             bottomNavigationBarTheme: BottomNavigationBarThemeData(
                 type: BottomNavigationBarType.fixed,
                 elevation: 20,
                 selectedItemColor: Colors.deepOrange,
                 backgroundColor: Colors.grey[200],
                 unselectedItemColor: Colors.black45
             )
         ),
         themeMode: NewsCubit.get(context).IsDark ? ThemeMode.dark : ThemeMode.light,
         darkTheme: ThemeData(

             textTheme: TextTheme(
                 bodyText1: TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.bold,
                     color: Colors.white
                 )
             ),
             primarySwatch: Colors.deepOrange,
             scaffoldBackgroundColor:HexColor('333739'),
             appBarTheme: AppBarTheme(
               titleSpacing: 20,
                 systemOverlayStyle: SystemUiOverlayStyle(
                     statusBarColor: HexColor('333739'),
                     statusBarIconBrightness: Brightness.light
                 ),
                 backgroundColor: Colors.transparent,
                 elevation: 0,
                 titleTextStyle: TextStyle(color: Colors.white,
                     fontSize: 20,fontWeight: FontWeight.bold),
                 iconTheme: IconThemeData(color: Colors.white,size: 30)
             ),
             bottomNavigationBarTheme: BottomNavigationBarThemeData(
                 type: BottomNavigationBarType.fixed,
                 elevation: 30,
                 selectedItemColor: Colors.deepOrange,
                 backgroundColor:HexColor('333739'),
                 unselectedItemColor: Colors.white

             )
         ),

       );
     },
      listener:(context, state) {

      },
    ),
    );
  }
}