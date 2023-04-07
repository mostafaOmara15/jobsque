import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/view_model/constants/end_points.dart';
import 'package:sizer/sizer.dart';
import '../../../resources/color_manager.dart';
import '../../../view_model/cubit/app_layout_cubit/app_layout_cubit.dart';
import '../../../view_model/cubit/app_layout_cubit/app_layout_states.dart';
import '../../../view_model/data/local/cache_helper.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppLayoutCubit(),
      child: BlocConsumer<AppLayoutCubit, AppLayoutStates>(
        listener: (BuildContext context, AppLayoutStates states){},
        builder: (BuildContext context, AppLayoutStates states){
          AppLayoutCubit layoutCubit = AppLayoutCubit.get(context);

          return Scaffold(
              body: SafeArea(
                child: Center(
                    child: AppLayoutCubit.appScreens[layoutCubit.selectedIndex]
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: layoutCubit.selectedIndex,
                onTap:(index){
                  layoutCubit.onItemTapped(index);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/appbar home.png",
                      width: 6.5.w,
                      color: layoutCubit.selectedIndex == 0
                        ? ColorManager.primaryColor
                        : ColorManager.grey
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                      icon: Image.asset(
                        "assets/appbar message.png",
                        width: 6.5.w,
                          color: layoutCubit.selectedIndex == 1
                              ? ColorManager.primaryColor
                              : ColorManager.grey
                      ),
                      label: 'Message'
                  ),
                  BottomNavigationBarItem(
                      icon: Image.asset(
                        "assets/appbar briefcase.png",
                        width: 6.5.w,
                          color: layoutCubit.selectedIndex == 2
                              ? ColorManager.primaryColor
                              : ColorManager.grey
                      ),
                      label: 'Applied'
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/appbar archive-minus.png",
                      width: 6.5.w,
                        color: layoutCubit.selectedIndex == 3
                            ? ColorManager.primaryColor
                            : ColorManager.grey
                    ),
                    label: 'Saved',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/appbar profile.png",
                      width: 6.5.w,
                        color: layoutCubit.selectedIndex == 4
                            ? ColorManager.primaryColor
                            : ColorManager.grey
                    ),
                    label: 'Profile',
                  ),
                ],
              )
          );
        }
      )
    );
  }
}
