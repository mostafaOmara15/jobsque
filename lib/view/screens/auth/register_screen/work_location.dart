import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/resources/padding_manager.dart';
import 'package:jobsque/view_model/constants/end_points.dart';
import 'package:jobsque/view_model/cubit/auth_cubit/register/work_location/work_lacation_states.dart';
import 'package:jobsque/view_model/cubit/auth_cubit/register/work_location/work_location_cubit.dart';
import 'package:sizer/sizer.dart';
import '../../../../resources/color_manager.dart';
import '../../../../view_model/cubit/auth_cubit/register/interested_work/interested_work_cubit.dart';
import '../../../../view_model/route/router.dart';
import '../../../widgets/auth_custom_widgets/preferred_location_button.dart';
import '../../../widgets/custom_button/custom_button.dart';

class WorkLocation extends StatelessWidget {
  List interestedWork;
  WorkLocation({
    required this.interestedWork
});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkLocationCubit(),
      child: BlocConsumer <WorkLocationCubit, WorkLocationStates>(
        listener: (BuildContext context, WorkLocationStates states) {
          if(states is UpdateProfileSuccessStates){
            Navigator.pushReplacementNamed(context, AppRoutes.announceAccountScreenRoute);
          }
        },
        builder: (BuildContext context, WorkLocationStates states){
          WorkLocationCubit workLocationCubit = WorkLocationCubit.get(context);

          return Scaffold(
            body: Padding(
              padding: PaddingManger.sidePadding,
              child: Column(
                children: [
                  SizedBox(height: 8.h,),
                  const Text(
                    "Where are you preferred Location?",
                    style: TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.w500,
                        color: ColorManager.darkBlue
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  const Text(
                    "Let us know, where is the work location you want at this time, so we can adjust it.",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: ColorManager.darkGrey
                    ),
                  ),
                  SizedBox(height: 5.h,),

                  DefaultTabController(
                    length: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 5.h,
                          decoration: BoxDecoration(
                              color: ColorManager.whiteGrey,
                              borderRadius: BorderRadius.circular(25.0)
                          ),
                          child:  TabBar(
                            onTap: (value) {
                              workLocationCubit.selectSite(value);
                            },
                            indicator: BoxDecoration(
                                color: ColorManager.highLightBlue,
                                borderRadius:  BorderRadius.circular(25.0)
                            ) ,
                            labelColor: Colors.white,
                            unselectedLabelColor: ColorManager.darkGrey,
                            tabs: const [
                              Tab(child: Text("Work From Office", style: TextStyle(fontSize: 19),)),
                              Tab(child: Text("Remote Work", style: TextStyle(fontSize: 19),)),
                            ],
                          ),
                        ),

                        SizedBox(height: 2.5.h,),
                        const Text(
                          "Select the country you want for your job",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.darkGrey
                          ),
                        ),

                        SizedBox(height: 2.h,),
                        Row(
                          children: [
                            PreferredLocation(
                              name: "United States",
                              select: workLocationCubit.unitedStates,
                              country: "assets/country united states.png",
                              toDo: (){
                                workLocationCubit.selectUnitedStates();
                              }
                            ),
                            SizedBox(width: 2.h,),
                            PreferredLocation(
                              name: "Malaysia",
                              select: workLocationCubit.malaysia,
                              country: "assets/country malaysia.png",
                              toDo: (){
                                workLocationCubit.selectMalaysia();
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h,),
                        Row(
                          children: [
                            PreferredLocation(
                              name: "Singapore",
                              select: workLocationCubit.singapore,
                              country: "assets/country singapore.png",
                              toDo: (){
                                workLocationCubit.selectSingapore();
                              },
                            ),
                            SizedBox(width: 2.h,),
                            PreferredLocation(
                              name: "Indonesia",
                              select: workLocationCubit.indonesia,
                              country: "assets/country indonesia.png",
                              toDo: (){
                                workLocationCubit.selectIndonesia();
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h,),
                        Row(
                          children: [
                            PreferredLocation(
                              name: "Philippines",
                              select: workLocationCubit.philippines,
                              country: "assets/country philiphines.png",
                              toDo: (){
                                workLocationCubit.selectPhilippines();
                              },
                            ),
                            SizedBox(width: 2.h,),
                            PreferredLocation(
                              name: "Polandia",
                              select: workLocationCubit.poland,
                              country: "assets/country polandia.png",
                              toDo: (){
                                workLocationCubit.selectPoland();
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h,),
                        Row(
                          children: [
                            PreferredLocation(
                              name: "India",
                              select: workLocationCubit.india,
                              country: "assets/country india.png",
                              toDo: (){
                                workLocationCubit.selectIndia();
                              },
                            ),
                            SizedBox(width: 2.h,),
                            PreferredLocation(
                              name: "Vietnam",
                              select: workLocationCubit.vietnam,
                              country: "assets/country Vietnam.png",
                              toDo: (){
                                workLocationCubit.selectVietnam();
                              },
                            ),
                            SizedBox(width: 2.h,),
                            PreferredLocation(
                              name: "China",
                              select: workLocationCubit.china,
                              country: "assets/country china.png",
                              toDo: (){
                                workLocationCubit.selectChina();
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h,),
                        Row(
                          children: [
                            PreferredLocation(
                              name: "Canada",
                              select: workLocationCubit.canada,
                              country: "assets/country canada.png",
                              toDo: (){
                                workLocationCubit.selectCanada();
                              },
                            ),
                            SizedBox(width: 2.h,),
                            PreferredLocation(
                              name: "Saudi Arabia",
                              select: workLocationCubit.saudiArabia,
                              country: "assets/country saudi.png",
                              toDo: (){
                                workLocationCubit.selectSaudiArabia();
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h,),
                        Row(
                          children: [
                            PreferredLocation(
                              name: "Argentina",
                              select: workLocationCubit.argentina,
                              country: "assets/country argentina.png",
                              toDo: (){
                                workLocationCubit.selectArgentina();
                              },
                            ),
                            SizedBox(width: 2.h,),
                            PreferredLocation(
                              name: "Brazil",
                              select: workLocationCubit.brazil,
                              country: "assets/country brazil.png",
                              toDo: (){
                                workLocationCubit.selectBrazil();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),
                  CustomButton(
                    title: "Next",
                    active: true,
                    toDo: (){
                      String interWork = interestedWork.join(",");
                      String offlineLocations = workLocationCubit.offlinePlaces.join(",");
                      String remoteLocations = workLocationCubit.remotePlaces.join(",");
                      print(interWork);
                      print(offlineLocations);
                      print(remoteLocations);

                      workLocationCubit.updatingProfile(
                          id: EndPoint.userId,
                          token: EndPoint.userToken,
                          interestedWork: interWork,
                          offlinePlaces: offlineLocations,
                          remotePlaces: remoteLocations
                      );
                    },
                  )
                ],
              ),
            ),
          );
        },
      )
    );
  }
}
