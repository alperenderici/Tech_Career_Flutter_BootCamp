import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bootcamp/sessions/s13/13.1/ui/cubit/homepage_cubit.dart';
// import 'package:flutter_bootcamp/sessions/s13/13.1/ui/cubit/person_detail_cubit.dart';
// import 'package:flutter_bootcamp/sessions/s13/13.1/ui/cubit/person_record_cubit.dart';
// import 'package:flutter_bootcamp/sessions/s13/13.1/ui/screen/homepage.dart';

import 'package:flutter_bootcamp/homeworks/hw6/ui/homepage.dart';
import 'package:flutter_bootcamp/homeworks/hw6/hw6_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: hw6ThemeData(),
      home: HomePage(),
    );

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
