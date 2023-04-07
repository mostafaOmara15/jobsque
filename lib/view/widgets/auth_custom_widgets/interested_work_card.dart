import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../resources/color_manager.dart';

class InterestedWorkCard extends StatelessWidget {

  bool select;
  String title;
  String icon;
  Function() toDo;

  InterestedWorkCard(
      {
        required this.select,
        required this.title,
        required this.icon,
        required this.toDo
      }
  );
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: toDo,
        child: Container(
          padding: EdgeInsets.all(15),
          height: 18.h,
          decoration: BoxDecoration(
              color: select
                  ? ColorManager.lightBlue
                  : ColorManager.whiteGrey,

              borderRadius: const BorderRadius.all(Radius.circular(15)),
              border: Border.all(
                width: 1.5,
                color: select
                    ? ColorManager.primaryColor
                    : ColorManager.lightGrey,
              )
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: select
                    ? ColorManager.primaryColor
                    : ColorManager.lightGrey,

                radius: 21.sp,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20.sp,
                  child: Image.asset(
                      icon,
                      color: select
                          ? ColorManager.primaryColor
                          : ColorManager.darkBlue,
                      width: 20.sp
                  ),
                ),
              ),
              Text(
                title,
                style: const TextStyle(color: ColorManager.darkBlue, fontSize: 20, fontWeight: FontWeight.w400),
              )
            ],
          ),
        )
      ),
    );
  }
}
