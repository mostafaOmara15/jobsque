import 'package:flutter/material.dart';
import 'package:jobsque/resources/color_manager.dart';
import 'package:jobsque/resources/padding_manager.dart';
import 'package:jobsque/view/screens/app_layout/home_screen/recent_job_section.dart';
import 'package:jobsque/view/screens/app_layout/home_screen/suggested_job_section.dart';
import 'package:jobsque/view/widgets/home_widgets/section_header.dart';
import 'package:jobsque/view_model/data/local/cache_helper.dart';
import 'package:sizer/sizer.dart';
import '../../../widgets/home_widgets/home_search_bar.dart';
import '../../../widgets/home_widgets/job_widgets/recent_job_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: PaddingManger.sidePadding,
        child: ListView(
          children: [
            SizedBox(height: 3.h,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hi, ${CacheHelper.getString("userName")}👋", style: TextStyle(color: ColorManager.darkBlue, fontSize: 33, fontWeight: FontWeight.w500)),
                    // SizedBox(height: 1.h,),
                    const Text("Create a better future for yourself here", style: TextStyle(color: ColorManager.darkGrey, fontSize: 19, fontWeight: FontWeight.w400)),
                  ],
                ),
                const Spacer(),
                CircleAvatar(
                  backgroundColor: ColorManager.lightGrey,
                  radius: 3.1.h,
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 3.h,
                      child: IconButton(
                          icon: Image.asset("assets/icon notification.png", color: ColorManager.darkBlue, width: 6.w,),
                          onPressed: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsScreen()));
                          }
                      )
                  ),
                ),
              ],
            ),
            SizedBox(height: 3.h,),
            const SearchBar(),
            SizedBox(height: 2.h,),

            SectionsHeader(title: "Suggested Jobs", viewAll: true),
            SizedBox(height: 2.h,),
            const SuggestedJobsSection(),
            SizedBox(height: 2.h,),

            SectionsHeader(title: "Recent Jobs", viewAll: true),
            const RecentJobsSection(),
          ],
        ),
      ),
    );
  }
}
