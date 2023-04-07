import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/view_model/data/local/cache_helper.dart';
import 'package:sizer/sizer.dart';
import '../../../../model/jobs/suggested_jobs_model.dart';
import '../../../../resources/color_manager.dart';
import '../../../../view_model/cubit/job_cubit/suggested_job_cubit/suggested_job_cubit.dart';
import '../../../../view_model/cubit/job_cubit/suggested_job_cubit/suggested_job_states.dart';
import 'job_property.dart';

class SuggestedJobCard extends StatefulWidget {

  JobData job;
  SuggestedJobCard({required this.job});

  @override
  State<SuggestedJobCard> createState() => _SuggestedJobCardState();
}

class _SuggestedJobCardState extends State<SuggestedJobCard> {
  bool saved = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: InkWell(
        child: Container(
          width: 75.w,
          padding: EdgeInsets.all(2.h),
          decoration: BoxDecoration(
              color: ColorManager.highLightBlue,
              borderRadius: BorderRadius.circular(15)
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/country brazil.png",width: 7.w),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(widget.job.name!, style: const TextStyle(color: Colors.white, fontSize: 23.5),),
                      Text(widget.job.compEmail!, style: TextStyle(color: ColorManager.grey, fontSize: 18))
                    ],
                  ),

                  IconButton(
                    icon:  saved == false
                        ? Image.asset("assets/icon archive-minus.png", color: Colors.white, width: 6.w,)
                        : Image.asset("assets/icon archive-minus fill.png", color: Colors.white, width: 6.w,),
                    onPressed: (){
                      setState(() {
                        saved = !saved;
                      });
                    },
                  )
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  JobProperty(property: widget.job.jobTimeType!, isSuggested: true),
                  JobProperty(property: widget.job.jobType!, isSuggested: true),
                  JobProperty(property: widget.job.jobLevel!, isSuggested: true),
                ],
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        const TextSpan(text: "\$",style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500)),
                        TextSpan(text: widget.job.salary!, style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                        const TextSpan(text: '/Month', style: TextStyle(fontSize: 12, color: ColorManager.grey)),
                      ],
                    ),
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: ColorManager.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: (){
                    },
                    child: const Text("Apply Now"),
                  )
                ],
              )
            ],
          ),
        ),
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => JobScreen(),));
        },
      ),
    );
  }
}
