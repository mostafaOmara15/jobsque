import 'package:flutter/material.dart';
import 'package:jobsque/resources/padding_manager.dart';
import 'package:jobsque/view/widgets/custom_button/custom_button.dart';
import 'package:sizer/sizer.dart';
import '../../../../resources/color_manager.dart';
import '../../../../view_model/route/router.dart';
import '../../../widgets/cutom_text_form_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);

  TextEditingController emailCtrl = TextEditingController();

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

            Text("Reset Password",
                style: TextStyle(
                    color: ColorManager.darkBlue,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w500
                )
            ),
            SizedBox(height: 1.5.h),
            const Text(
              "Enter the email address you used when you joined and we’ll send you instructions to reset your password.",
              style: TextStyle(
                color: ColorManager.darkGrey,
                fontSize: 20,
              ),
            ),

            SizedBox(
              height: 5.h,
            ),

            CustomTextFormField(
              fieldCtrl: emailCtrl,
              validate: (value) {
                if (value.isEmpty) {
                  return 'Please Enter Your Email';
                }
                return null;
              },
              fieldIcon: Icons.email_outlined,
              fieldHint: "Email",
              fieldInput: TextInputType.name,
              isSecured: false,
              withIcon: false,
            ),
            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "You remember your password? ",
                  style: TextStyle(
                      color: ColorManager.grey,
                      fontSize: 19.5,
                      fontWeight: FontWeight.w400
                  ),
                ),

                TextButton(
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: ColorManager.primaryColor,
                        fontSize: 19.5,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.loginScreenRoute);
                  },
                ),
              ],
            ),

            CustomButton(
              title: "Request password reset",
                active: true,
                toDo: (){
                  Navigator.pushReplacementNamed(context, AppRoutes.announceCheckEmailScreenRoute);
                }
            ),
            SizedBox(height: 2.h,),
          ],
        ),
      ),
    );
  }
}


