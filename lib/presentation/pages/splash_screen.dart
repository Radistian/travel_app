// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/core/routing/app_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool intro = false;
  String login = "";
  cekData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
    if (prefs.getBool('isIntro') != null) {
        intro = prefs.getBool('isIntro')!;
        if(prefs.getString('login') != null){
          login = prefs.getString('login')!;
        }
    }
    });
}

  void initState() {
    Future.delayed(Duration(seconds: 3), () => !intro ? context.goNamed(Routes.intro) : login == "" ? context.goNamed(Routes.login) : context.goNamed(Routes.home));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    cekData();  
    return Scaffold(
      body : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Image.asset('assets/img/traver.png',height: 200,width: 200,),
            ),
            Text('Version 1.1.0')
          ],
        ),
      ),
    );
  }
}