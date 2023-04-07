import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jobsque/view_model/data/local/cache_helper.dart';
import 'package:sizer/sizer.dart';
import '../../../view_model/route/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool onBoarding = CacheHelper.getBoolean("onBoarding") == null
      ? true
      : false;
  @override
  void initState()
  {
    super.initState();
    if(onBoarding == true){
      Timer(const Duration(seconds:3), ()=>Navigator.pushReplacementNamed(context, AppRoutes.onBoardingRoute,));
    }
    else{
      Timer(const Duration(seconds:3), ()=>Navigator.pushReplacementNamed(context, AppRoutes.loginScreenRoute,));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Center(
            child: CircleAvatar(
              backgroundColor: Color(0xfff9fbff),
              radius: 350,
            ),
          ),
          const Center(
            child: CircleAvatar(
              backgroundColor: Color(0xfff4f8ff),
              radius: 250,
            ),
          ),
          const Center(
            child: CircleAvatar(
              backgroundColor: Color(0xfff1f5ff),
              radius: 150,
            ),
          ),
          const Center(
            child: CircleAvatar(
              backgroundColor: Color(0xffe9f0ff),
              radius: 95,
            ),
          ),
          Center(
            child: Image.asset('assets/Logo.png', width: 30.w,),
          )
        ],
      ),
    );
  }
}

