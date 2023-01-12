import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bootcamp/sessions/s16/16.2/notification_page.dart';
// import 'package:flutter_bootcamp/sessions/s16/16.3/location_usage.dart';
// import 'package:flutter_bootcamp/sessions/s16/16.3/map_usage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sessions/s16/16.1/ui/cubit/homepage_cubit.dart';
import 'sessions/s16/16.1/ui/cubit/person_detail_cubit.dart';
import 'sessions/s16/16.1/ui/cubit/person_record_cubit.dart';
import 'sessions/s16/16.1/ui/screen/homepage.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Material App',
//       // home: NotificationPage(),
//       home: LocationUsage(),
//       // home: MapUsage(),
//     );
//   }

// session 16.1
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PersonRecordCubit()),
        BlocProvider(create: (context) => PersonDetailCubit()),
        BlocProvider(create: (context) => HomePageCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: HomePage(),
      ),
    );
  }

  //session 15.2
  // return MultiBlocProvider(
  //   providers: [
  //     BlocProvider(create: (context) => PersonRecordCubit()),
  //     BlocProvider(create: (context) => PersonDetailCubit()),
  //     BlocProvider(create: (context) => HomePageCubit()),
  //   ],
  //   child: MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'Material App',
  //     home: HomePage(),
  //   ),
  // );

  //Session 14
  // return MultiBlocProvider(
  //   providers: [
  //     BlocProvider(create: (context) => PersonRecordCubit()),
  //     BlocProvider(create: (context) => PersonDetailCubit()),
  //     BlocProvider(create: (context) => HomePageCubit()),
  //   ],
  //   child: MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'Material App',
  //     home: HomePage(),
  //   ),
  // );

  //Hw7
  // return MultiBlocProvider(
  //   providers: [
  //     BlocProvider(create: (context) => TodoRecordCubit()),
  //     BlocProvider(create: (context) => TodoDetailCubit()),
  //     BlocProvider(create: (context) => HomePageCubit()),
  //   ],
  //   child: MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'Material App',
  //     theme: hw7ThemeData(),
  //     home: HomePage(),
  //   ),
  // );

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
  // }

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
