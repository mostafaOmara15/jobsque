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
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 17.w,
          height: 7.w,
          decoration: BoxDecoration(
            color: isSuggested
                ? ColorManager.blue
                : ColorManager.lightBlue,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
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
      ),
    );
  }
}
