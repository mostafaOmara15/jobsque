import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../resources/color_manager.dart';

class AcountContainer extends StatelessWidget {

  String account;
  Function() toDo;
  AcountContainer({required this.account, required this.toDo});

  @override
  Widget build(BuildContext context) {
    if(account == "Facebook") {
      return Expanded(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: toDo,
              child: Container(
                  height: 6.5.h,
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.lightGrey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("assets/Facebook.png", width: 6.w,),
                      Text("Facebook", style: TextStyle(
                          color: ColorManager.darkBlue, fontSize: 14.sp),)
                    ],
                  )
              ),
            )
        ),
      );
    } else{
      return Expanded(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: toDo,
              child: Container(
                  height: 6.5.h,
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.lightGrey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("assets/google.png", width: 5.w,),
                      Text("Google", style: TextStyle(color: ColorManager.darkBlue, fontSize: 14.sp),)
                    ],
                  )
              ),
            )
        ),
      );
    }
  }
}
