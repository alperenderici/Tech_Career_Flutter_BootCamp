import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/homeworks/hw7/ui/cubit/todo_detail_cubit.dart';
import 'package:flutter_bootcamp/homeworks/hw7/ui/cubit/todo_record_cubit.dart';
import 'package:flutter_bootcamp/homeworks/hw7/ui/cubit/homepage_cubit.dart';
import 'package:flutter_bootcamp/homeworks/hw7/ui/hw7_theme.dart';

import 'homeworks/hw7/ui/screens/homepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoRecordCubit()),
        BlocProvider(create: (context) => TodoDetailCubit()),
        BlocProvider(create: (context) => HomePageCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: hw7ThemeData(),
        home: HomePage(),
      ),
    );

    //hw6
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Material App',
    //   theme: hw6ThemeData(),
    //   home: HomePage(),
    // );

//Session 11.2
    // return MultiBlocProvider(
    //   providers: [
    //  BlocProvider(
    //       create: (context) => HomePageCubit(),
    //     ),
    //   ],
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Material App',
    //     // theme: hw6ThemeData(),
    //     home: HomePage(),
    //   ),
    // );

//Session 12.1
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(create: (context) => PersonRecordCubit()),
    //     BlocProvider(create: (context) => PersonDetailCubit()),
    //     BlocProvider(create: (context) => HomePageCubit()),
    //   ],
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Material App',
    //     // theme: hw6ThemeData(),
    //     home: HomePage(),
    //   ),
    // );

//Session 12.2
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Material App',
    //   // theme: hw6ThemeData(),
    //   home: HomePage(),
    // );
  }
  //Session 13
  //  return MultiBlocProvider(
  //     providers: [
  //       BlocProvider(create: (context) => PersonRecordCubit()),
  //       BlocProvider(create: (context) => PersonDetailCubit()),
  //       BlocProvider(create: (context) => HomePageCubit()),
  //     ],
  //     child: MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       title: 'Material App',
  //       // theme: hw6ThemeData(),
  //       home: HomePage(),
  //     ),
  //   );

}
