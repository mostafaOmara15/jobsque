import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../resources/color_manager.dart';
import 'job_property.dart';


class RecentJobCard extends StatefulWidget {

  @override
  State<RecentJobCard> createState() => _RecentJobCardState();
}

class _RecentJobCardState extends State<RecentJobCard> {
  bool saved = false;

  @override
  Widget build(BuildContext context) {
        return SizedBox(
          height: 13.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(child: Image.asset("assets/country brazil.png", width: 7.w)),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text("Senior UI Designer", style: TextStyle(color: ColorManager.darkBlue, fontSize: 23.5),),
                      Text("Twitter • Jakarta, Indonesia", style: TextStyle(color: ColorManager.darkBlue, fontSize: 18))
                    ],
                  ),
                  IconButton(
                    icon: saved == false
                        ? Image.asset("assets/icon archive-minus.png", color: ColorManager.darkBlue, width: 6.w,)
                        : Image.asset("assets/icon archive-minus fill.png", color: ColorManager.primaryColor, width: 6.w,),
                    onPressed: (){
                      setState(() {
                        saved = !saved;
                      });
                    },
                  )
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  JobProperty(property: "Fulltime", isSuggested: false,),
                  JobProperty(property: "Remote", isSuggested: false,),
                  JobProperty(property: "Design", isSuggested: false,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        const TextSpan(text: "\$",style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold)),
                        TextSpan(text: "15K",style: const TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold)),
                        const TextSpan(text: '/Month', style: TextStyle(fontSize: 14, color: ColorManager.darkGrey)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
  }
}
