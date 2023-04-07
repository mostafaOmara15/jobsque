import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../resources/color_manager.dart';

class JobProperty  extends StatelessWidget {

  String property;
  bool isSuggested ;

  JobProperty({
    required this.property, required this.isSuggested
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Container(

        decoration: BoxDecoration(
          color: isSuggested
              ? ColorManager.blue
              : ColorManager.lightBlue,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: Padding(
              padding: EdgeInsets.all(1.h),
              child: Expanded(
                child: Flexible(
                  child: Text(
                      property,
                      style: TextStyle(
                          fontSize: 18,
                          color: isSuggested
                              ? Colors.white
                              : ColorManager.primaryColor
                      )
                  ),
                ),
              ),
            )
        ),
      ),
    );
  }
}
