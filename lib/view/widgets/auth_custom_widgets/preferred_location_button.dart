import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../resources/color_manager.dart';

class PreferredLocation extends StatelessWidget {
  bool select;
  String country;
  String name;
  Function() toDo;

  PreferredLocation(
    {
      required this.select,
      required this.country,
      required this.name,
      required this.toDo
    }
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: toDo,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: select
                ? ColorManager.lightBlue
                : ColorManager.whiteGrey,

            borderRadius: const BorderRadius.all(Radius.circular(30)),
            border: Border.all(
              width: 1.5,
              color: select
                  ? ColorManager.primaryColor
                  : ColorManager.lightGrey,
            )
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(country, width: 26,),
            SizedBox(width: 2.w,),
            Text(
                name,
                style: const TextStyle(
                    color: ColorManager.darkBlue,
                    fontWeight: FontWeight.w400,
                    fontSize: 19
                )
            )
          ],
        ),
      ),
    );
  }
}
