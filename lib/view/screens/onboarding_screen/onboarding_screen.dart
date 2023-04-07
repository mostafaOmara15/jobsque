import 'package:flutter/material.dart';
import 'package:jobsque/view_model/data/local/cache_helper.dart';
import 'package:jobsque/view_model/route/router.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/padding_manager.dart';
import '../../widgets/custom_button/custom_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}


final PageController controller = PageController();

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
            toolbarHeight: 5.h,
            flexibleSpace: Padding(
              padding: PaddingManger.sidePadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/Logo.png", width: 20.w),
                  TextButton(
                    child: const Text("Skip", style: TextStyle(fontSize: 16, color: ColorManager.darkGrey)),
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, AppRoutes.loginScreenRoute);
                    }
                  )
                ],
              ),
            ),
          ),

        body: PageView(
          controller: controller,
          onPageChanged: (index){
              setState(() {
                isLastPage = index == 2;
              });
            },
          children: [
            Column(
                children: [
                  Image.asset("assets/Background1.png",),
                  Padding(
                    padding: PaddingManger.sidePadding,
                    child: Column(
                      children: [
                        SizedBox(height: 7.5.h),
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(fontSize: 34, fontWeight: FontWeight.w400),
                            children: <TextSpan>[
                              TextSpan(text: 'Find a job, and ',style: TextStyle(color: ColorManager.darkBlue)),
                              TextSpan(text: 'start building', style: TextStyle(color: ColorManager.primaryColor)),
                              TextSpan(text: ' your career from now on', style: TextStyle(color: ColorManager.darkBlue)),
                            ],
                          ),
                        ),
                        SizedBox(height: 2.h),
                        const Text(
                          "Explore over 25,924 available job roles and upgrade your operator now.",
                          style: TextStyle(fontSize: 20, color: ColorManager.darkGrey, fontWeight: FontWeight.w400)
                        ),
                      ],
                    ),
                  )
                ],
              ),

            Column(
                children: [
                  Image.asset("assets/Background2.png"),
                  Padding(
                    padding: PaddingManger.sidePadding,
                    child: Column(
                      children: [
                        SizedBox(height: 2.h),
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(fontSize: 34, fontWeight: FontWeight.w400),
                            children: <TextSpan>[
                              TextSpan(text: 'Hundreds of jobs are waiting for you to ',style: TextStyle(color: ColorManager.darkBlue)),
                              TextSpan(text: 'join together', style: TextStyle(color: ColorManager.primaryColor)),
                            ],
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text("Immediately join us and start applying for the job you are interested in.", style: TextStyle(fontSize: 16.sp, color: ColorManager.darkGrey),)
                      ],
                    ),
                  )
                ],
              ),

            Column(
              children: [
                Image.asset("assets/Background3.png"),
                SizedBox(height: 2.h),
                Padding(
                    padding: PaddingManger.sidePadding,
                  child: Column(
                    children: [
                      RichText(
                          text: const TextSpan(
                            style: TextStyle(fontSize: 34, fontWeight: FontWeight.w400),
                            children: <TextSpan>[
                              TextSpan(text: "Get the best  ",style: TextStyle(color: ColorManager.darkBlue)),
                              TextSpan(text: 'choice for the job', style: TextStyle(color: ColorManager.primaryColor)),
                              TextSpan(text: " you've always dreamed of", style: TextStyle(color: ColorManager.darkBlue)),
                            ],
                          ),
                        ),
                      SizedBox(height: 2.h),
                      Text("Explore over 25,924 available job roles and upgrade your operator now.", style: TextStyle(fontSize: 16.sp, color: ColorManager.darkGrey),)
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),

        bottomSheet: Container(
            color: Colors.white,
            height: 15.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: const WormEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        dotColor: Color(0xffADC8FF),
                        activeDotColor: ColorManager.primaryColor
                      ),
                    ),

                    CustomButton(
                      title: isLastPage == false ? "Next" : "Get Started",
                      active: true,
                      toDo: isLastPage == true
                          ? () async {
                              CacheHelper.setBoolean("onBoarding", false);
                              Navigator.pushReplacementNamed(context, AppRoutes.loginScreenRoute);
                            }
                          :() => controller.nextPage(
                            duration: const Duration(microseconds: 500),
                            curve: Curves.easeInOut
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
      )
    );
  }
}
