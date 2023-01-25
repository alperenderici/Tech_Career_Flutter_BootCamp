import 'package:bootcamp_project/ui/cubit/basket_cubit.dart';
import 'package:bootcamp_project/ui/cubit/food_detail_cubit.dart';
import 'package:bootcamp_project/ui/cubit/homepage_cubit.dart';
import 'package:bootcamp_project/ui/screens/homepage.dart';
import 'package:bootcamp_project/ui/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomePageCubit()),
        BlocProvider(create: (context) => FoodDetailCubit()),
        BlocProvider(create: (context) => BasketCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // title: 'Material App',
        theme: projectThemeData(),
        home: const HomePage(),
      ),
    );
  }
}
