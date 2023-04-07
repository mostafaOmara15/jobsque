import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/view/widgets/home_widgets/job_widgets/recent_job_card.dart';
import 'package:jobsque/view_model/cubit/job_cubit/recent_job_cubit/recent_job_state.dart';
import 'package:sizer/sizer.dart';
import '../../../../view_model/constants/end_points.dart';
import '../../../../view_model/cubit/job_cubit/recent_job_cubit/recent_job_cubit.dart';

class RecentJobsSection extends StatelessWidget {
  const RecentJobsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RecentJobCubit()..getRecentJobs(token: EndPoint.userToken),
        child: BlocConsumer<RecentJobCubit, RecentJobStates>(
            listener: (BuildContext context, RecentJobStates state) {},
            builder: (BuildContext context, RecentJobStates state) {
              RecentJobCubit recentJobCubit = RecentJobCubit.get(context);
              return state is RecentJobLoadingState
                  ? const Center(child: CircularProgressIndicator())
                  : state is RecentJobSuccessState
                    ? ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: recentJobCubit.recentJobsList!.length,
                itemBuilder: (context, index) {
                  print(index);
                  return Column(
                    children: [
                      RecentJobCard(job: recentJobCubit.recentJobsList![index]),
                      SizedBox(height: 1.h),
                      const Divider(height: 4),
                      SizedBox(height: 2.h),
                    ],
                  );
                },
              )
                    : const Center(child: Text("Error"));
            }
        )
    );
  }
}
