import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/resources/color_manager.dart';
import 'package:jobsque/view/screens/app_layout/app_layout.dart';
import 'package:jobsque/view/screens/auth/login_screen/login_screen.dart';
import 'package:jobsque/view/screens/auth/reset_password/reset_password_screen.dart';
import 'package:jobsque/view_model/cubit/app_layout_cubit/app_layout_cubit.dart';
import 'package:jobsque/view_model/cubit/auth_cubit/login/login_cubit.dart';
import 'package:jobsque/view_model/cubit/auth_cubit/register/interested_work/interested_work_cubit.dart';
import 'package:jobsque/view_model/cubit/auth_cubit/register/register_cubit.dart';
import 'package:jobsque/view_model/cubit/auth_cubit/register/work_location/work_location_cubit.dart';
import 'package:jobsque/view_model/cubit/block_observer.dart';
import 'package:jobsque/view_model/cubit/job_cubit/suggested_job_cubit/suggested_job_cubit.dart';
import 'package:jobsque/view_model/data/local/cache_helper.dart';
import 'package:jobsque/view_model/data/remote/dio_helper.dart';
import 'package:jobsque/view_model/route/router.dart';
import 'package:jobsque/view_model/route/routes.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  CacheHelper.init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
            providers:[
              BlocProvider(create: (context) => LoginCubit()),
              BlocProvider(create: (context) => RegisterCubit()),
              BlocProvider(create: (context) => InterestedWorkCubit()),
              BlocProvider(create: (context) => WorkLocationCubit()),
              BlocProvider(create: (context) => AppLayoutCubit()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,

              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,

                appBarTheme: const AppBarTheme(
                  titleTextStyle: TextStyle(color: ColorManager.darkBlue, fontSize: 20),
                  elevation: 0,
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  backgroundColor: Colors.white,
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Colors.transparent,
                  selectedItemColor: ColorManager.primaryColor,
                  unselectedItemColor: ColorManager.grey,
                  showUnselectedLabels: true,
                  elevation: 0,
                )
              ),

              // home: LoginScreen(),

              initialRoute: AppRoutes.splashRoute,
              onGenerateRoute: onGenerate,
            ),
        );
      },
    );
  }
}

