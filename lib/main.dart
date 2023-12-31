// ignore_for_file: unused_import

import 'package:SneakerQuest/screens/authentication/login_page.dart';
import 'package:SneakerQuest/screens/authentication/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:SneakerQuest/cubit/favourite_cubit.dart';
import 'package:SneakerQuest/screens/about_page.dart';
import 'package:SneakerQuest/screens/bag.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/homePage.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => FavouriteCubitCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      home:const  SplashScreenPage(),
    );
  }
}
