import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../../view_model/cubit/job_cubit/suggested_job_cubit/suggested_job_cubit.dart';
import '../../../../view_model/cubit/job_cubit/suggested_job_cubit/suggested_job_states.dart';
import '../../../../view_model/data/local/cache_helper.dart';
import '../../../widgets/home_widgets/job_widgets/suggested_job_card.dart';

class SuggestedJobsSection extends StatefulWidget {
  const SuggestedJobsSection({Key? key}) : super(key: key);

  @override
  State<SuggestedJobsSection> createState() => _SuggestedJobsSectionState();
}

class _SuggestedJobsSectionState extends State<SuggestedJobsSection> {

  @override
  void initState() {
    // SuggestedJobCubit().getSuggestedJobs(id: CacheHelper.getInt("userId"), token: CacheHelper.getString("userToken"));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SuggestedJobCubit()..getSuggestedJobs(id: 328, token: CacheHelper.getString("userToken")),
      child: BlocConsumer<SuggestedJobCubit, SuggestedJobStates>(
        listener: (BuildContext context, SuggestedJobStates state) {

          // if(state is SuggestedJobInitialState){
          //   SuggestedJobCubit().getSuggestedJobs();
          // }
        },
        builder: (BuildContext context, SuggestedJobStates state) {
          if(state is SuggestedJobLoadingState){
            return CircularProgressIndicator();
          }
          else if(state is SuggestedJobSuccessState){
            return SizedBox(
              height: 25.h,
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount:1,
                      itemBuilder: (context, index) {
                        return Text("gdv");
                      },
                    ),
                  ),
                ],
              ),
            );
          }else{
            return SizedBox();
          }
          // SuggestedJobCubit suggetedJobCubit = SuggestedJobCubit();

        }
      )
    );
  }
}
