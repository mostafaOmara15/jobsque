import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/view_model/constants/end_points.dart';
import 'package:sizer/sizer.dart';
import '../../../../view_model/cubit/job_cubit/suggested_job_cubit/suggested_job_cubit.dart';
import '../../../../view_model/cubit/job_cubit/suggested_job_cubit/suggested_job_states.dart';
import '../../../widgets/home_widgets/job_widgets/suggested_job_card.dart';

class SuggestedJobsSection extends StatefulWidget {
  const SuggestedJobsSection({Key? key}) : super(key: key);

  @override
  State<SuggestedJobsSection> createState() => _SuggestedJobsSectionState();
}

class _SuggestedJobsSectionState extends State<SuggestedJobsSection> {

  @override
  // void initState() {
  //   print("${CacheHelper.getInt("userId")} ${CacheHelper.getString(
  //       "userToken")}");
  //   print("${EndPoint.userToken} ${EndPoint.userId}");
  //   SuggestedJobCubit().getSuggestedJobs(
  //       id: EndPoint.userId, token: EndPoint.userToken);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SuggestedJobCubit()..getSuggestedJobs(
            id: EndPoint.userId, token: EndPoint.userToken),
        child: BlocConsumer<SuggestedJobCubit, SuggestedJobStates>(
            listener: (BuildContext context, SuggestedJobStates state) {
              // if(state is SuggestedJobInitialState){
              //   SuggestedJobCubit().getSuggestedJobs();
              // }
            },
            builder: (BuildContext context, SuggestedJobStates state) {
              SuggestedJobCubit suggestedJobCubit = SuggestedJobCubit.get(context);
              return SizedBox(
                  height: 22.h,
                  child: state is SuggestedJobLoadingState
                      ? CircularProgressIndicator()
                      : state is SuggestedJobSuccessState
                        ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: suggestedJobCubit.suggestedJobsList!.length,
                    itemBuilder: (context, index) {
                      print(index);
                      return SuggestedJobCard(
                          job: suggestedJobCubit.suggestedJobsList![index]);
                    },
                  )
              : Text("fesfsfs")

              );
            }
        )
    );
  }
}
