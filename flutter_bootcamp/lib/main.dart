import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp/sessions/s11/11.2/homepage.dart';
import 'package:flutter_bootcamp/sessions/s11/11.2/homepage_cubit.dart';

// import 'package:flutter_bootcamp/homeworks/hw6/ui/homepage.dart';
// import 'package:flutter_bootcamp/homeworks/hw6/hw6_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Material App',
    //   // theme: hw6ThemeData(),
    //   home: HomePage(),
    // );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomePageCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        // theme: hw6ThemeData(),
        home: HomePage(),
      ),
    );
  }
}
