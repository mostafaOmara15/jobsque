import 'package:flutter/material.dart';
import 'package:jobsque/resources/color_manager.dart';
import 'package:jobsque/resources/padding_manager.dart';
import 'package:jobsque/view/widgets/custom_button/custom_button.dart';
import 'package:jobsque/view_model/route/router.dart';
import 'package:sizer/sizer.dart';

class AnnounceCheckEmail extends StatelessWidget {
  const AnnounceCheckEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: PaddingManger.sidePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h,),
            Center(child: Image.asset("assets/AnnouncecCheckcEmail.png", width: 50.w,)),
            SizedBox(height: 3.h,),
            const Text("Check your Email", style: TextStyle(color: ColorManager.darkBlue, fontSize: 33, fontWeight: FontWeight.w400)),
            SizedBox(height: 2.h,),
            const Text(
                "We have sent a reset password to your email address",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorManager.darkGrey,
                  fontSize: 19.5, fontWeight: FontWeight.w400,
                )
            ),
            const Spacer(),
            CustomButton(
              title: "Open email app",
              active: true,
              toDo: (){
                Navigator.pushReplacementNamed(context, AppRoutes.createPasswordScreenRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
