import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../resources/color_manager.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 6.h,
        padding: EdgeInsets.symmetric(horizontal: 3.5.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: ColorManager.lightGrey, width: 1)
        ),
        child: Row(
          children: [
            Image.asset("assets/icon search-normal.png", width: 6.w, color: ColorManager.darkBlue,),
            SizedBox(width: 4.w,),
            Text("Search...", style: TextStyle(color: ColorManager.grey, fontSize: 14.sp))
          ],
        ),
      ),

      onTap: () {
        // showSearch(context: context, delegate: DataSearch());
      },
    );
  }
}

