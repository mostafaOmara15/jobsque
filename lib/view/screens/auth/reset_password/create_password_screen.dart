import 'package:flutter/material.dart';
import 'package:jobsque/view_model/route/router.dart';
import 'package:sizer/sizer.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/padding_manager.dart';
import '../../../widgets/custom_button/custom_button.dart';
import '../../../widgets/cutom_text_form_field.dart';

class CreatePasswordScreen extends StatefulWidget {
  CreatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  TextEditingController passwordCtrl = TextEditingController();

  TextEditingController confirmPasswordCtrl = TextEditingController();

  bool isSecured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: Image.asset("assets/Logo.png", width: 25.w),
          )
        ],
      ),

      body: Padding(
        padding: PaddingManger.sidePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.h),

            Text("Create new password",
                style: TextStyle(
                    color: ColorManager.darkBlue,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w500
                )
            ),
            SizedBox(height: 1.5.h),
            const Text(
              "Set your new password so you can login and acces Jobsque",
              style: TextStyle(
                color: ColorManager.darkGrey,
                fontSize: 20,
              ),
            ),

            SizedBox(
              height: 5.h,
            ),

            CustomTextFormField(
              fieldCtrl: passwordCtrl,
              validate: (value) {
                if (value.isEmpty) {
                  return 'Enter your Password';
                }
                return null;
              },
              fieldIcon: Icons.lock_outline_rounded,
              fieldHint: "Password",
              fieldInput: TextInputType.visiblePassword,
              isSecured: isSecured,
              withIcon: true,
              showPass: () {
                setState(() {
                  isSecured = !isSecured;
                });
              },
            ),
            SizedBox(height: 1.h,),
            const Text("Password must be at least 8 characters", style: TextStyle(color: ColorManager.grey, fontWeight: FontWeight.w400, fontSize: 20),),
            SizedBox(height: 2.h,),
            CustomTextFormField(
              fieldCtrl: confirmPasswordCtrl,
              validate: (value) {
                if (value.isEmpty) {
                  return 'Enter your Password';
                }
                return null;
              },
              fieldIcon: Icons.lock_outline_rounded,
              fieldHint: "Confirm Password",
              fieldInput: TextInputType.visiblePassword,
              isSecured: isSecured,
              withIcon: true,
              showPass: () {
                setState(() {
                  isSecured = !isSecured;
                });
              },
            ),
            SizedBox(height: 1.h,),
            const Text("Both password must match", style: TextStyle(color: ColorManager.grey, fontWeight: FontWeight.w400, fontSize: 20),),
            const Spacer(),

            CustomButton(
                title: "Reset Password",
                active: true,
                toDo: (){
                  if(passwordCtrl.text == confirmPasswordCtrl.text)
                    {
                      Navigator.pushReplacementNamed(context,AppRoutes.announcePasswordChangedScreenRoute);
                    }
                }
            ),
            SizedBox(height: 2.h,),
          ],
        ),
      ),
    );
  }
}
