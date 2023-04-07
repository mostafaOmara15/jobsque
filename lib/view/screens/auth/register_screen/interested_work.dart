import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/view/screens/auth/register_screen/work_location.dart';
import 'package:jobsque/view_model/route/router.dart';
import 'package:sizer/sizer.dart';
import '../../../../resources/color_manager.dart';
import '../../../../view_model/cubit/auth_cubit/register/interested_work/interested_work_cubit.dart';
import '../../../../view_model/cubit/auth_cubit/register/interested_work/interested_work_states.dart';
import '../../../widgets/custom_button/custom_button.dart';
import '../../../widgets/auth_custom_widgets/interested_work_card.dart';

class InterestedWork extends StatelessWidget {
  const InterestedWork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InterestedWorkCubit(),
      child: BlocConsumer <InterestedWorkCubit, InterestedWorkStates>(
        listener: (BuildContext context, InterestedWorkStates states) {},
        builder: (BuildContext context, InterestedWorkStates states){

          InterestedWorkCubit interestedWorkCubit = InterestedWorkCubit.get(context);

          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(height: 4.h,),
                    const Text(
                      "What type of work are you interested in?",
                      style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.w500,
                          color: ColorManager.darkBlue
                      ),
                    ),

                    SizedBox(height: 2.h,),

                    const Text(
                      "Tell us what you’re interested in so we can customise the app for your needs.",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: ColorManager.darkGrey
                      ),
                    ),

                    SizedBox(height: 3.h,),

                    Row(
                      children: [
                        InterestedWorkCard(
                          title: "UI/UX Designer",
                          icon: "assets/bezier.png",
                          select: interestedWorkCubit.UI_UX_designer,
                          toDo: () {
                            interestedWorkCubit.selectUi_UX_Designer();
                          },
                        ),

                        SizedBox(width: 5.w),

                        InterestedWorkCard(
                          title: "Illustrator Category",
                          icon: "assets/pen-tool-2.png",
                          select: interestedWorkCubit.illustratorDesigner,
                          toDo: () {
                            interestedWorkCubit.selectIllustratorDesigner();
                          },
                        ),
                      ],
                    ),

                    SizedBox(height: 2.h,),

                    Row(
                      children: [
                        InterestedWorkCard(
                          title: "Developer",
                          icon: "assets/code.png",
                          select: interestedWorkCubit.developer,
                          toDo: () {
                            interestedWorkCubit.selectDeveloper();
                          },
                        ),

                        SizedBox(width: 5.w),

                        InterestedWorkCard(
                          title: "Management",
                          icon: "assets/graph.png",
                          select: interestedWorkCubit.management,
                          toDo: () {
                            interestedWorkCubit.selectManagement();
                          },
                        ),
                      ],
                    ),

                    SizedBox(height: 2.h,),

                    Row(
                      children: [
                        InterestedWorkCard(
                          title: "Information Technology",
                          icon: "assets/monitor-mobbile.png",
                          select: interestedWorkCubit.informationTechnology,
                          toDo: () {
                            interestedWorkCubit.selectInformationTechnology();
                          },
                        ),

                        SizedBox(width: 5.w),

                        InterestedWorkCard(
                          title: "Research and Analytics",
                          icon: "assets/cloud-add.png",
                          select: interestedWorkCubit.researchAnalytics,
                          toDo: () {
                            interestedWorkCubit.selectResearchAnalytics();
                          },
                        ),
                      ],
                    ),

                    const Spacer(),

                    CustomButton(
                      title: "Next",
                      active: true,
                      toDo: (){
                        print(interestedWorkCubit.interestedWork);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => WorkLocation(interestedWork: interestedWorkCubit.interestedWork)));
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        },
      )
    );
  }
}