import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/view_model/data/local/cache_helper.dart';
import 'package:jobsque/view_model/route/router.dart';
import 'package:sizer/sizer.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/padding_manager.dart';
import '../../../../view_model/cubit/auth_cubit/login/login_cubit.dart';
import '../../../../view_model/cubit/auth_cubit/login/login_states.dart';
import '../../../../view_model/cubit/job_cubit/suggested_job_cubit/suggested_job_cubit.dart';
import '../../../widgets/account_auth.dart';
import '../../../widgets/custom_button/custom_button.dart';
import '../../../widgets/custom_button/loading_button.dart';
import '../../../widgets/cutom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController emailCtrl = TextEditingController(text: "mostafa17@gmail.com");
  TextEditingController passwordCtrl = TextEditingController(text: "123456789");

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, LoginStates states) {
          if (states is LoginSuccessState) {
            // SuggestedJobCubit().getSuggestedJobs(token: CacheHelper.getString("userToken"), id: CacheHelper.getInt("userId"));
            Navigator.pushReplacementNamed(context, AppRoutes.layoutScreenRoute);
            print(CacheHelper.getInt("userId"));
            print(CacheHelper.getString("userToken"));
          }
        },

        builder: (BuildContext context, LoginStates states) {
          LoginCubit loginCubit = LoginCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: Image.asset("assets/Logo.png", width: 25.w),
                )
              ],
            ),

            body: Form(
              key: loginKey,

              child: Padding(
                padding: PaddingManger.sidePadding,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.h),

                      Text("Login",
                          style: TextStyle(
                              color: ColorManager.darkBlue,
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w500
                          )
                      ),
                      SizedBox(height: 1.5.h),
                      const Text(
                        "Please login to find your dream job",
                        style: TextStyle(
                            color: ColorManager.darkGrey,
                            fontSize: 18,
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

                      SizedBox(
                        height: 2.5.h,
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
                        isSecured: loginCubit.showPass,
                        withIcon: true,
                        showPass: () {
                          loginCubit.changePasswordVisibility();
                        },
                      ),

                      SizedBox(height: 1.h),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.ideographic,
                        children: [
                          Checkbox(
                            activeColor: ColorManager.primaryColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            value: loginCubit.isChecked,
                            onChanged: (bool? value) {
                              loginCubit.changeCheck(value);
                            }
                          ),

                          const Text(
                            "Remember me",
                            style: TextStyle(
                                color: ColorManager.darkBlue,
                                fontSize: 16.7,
                              fontWeight: FontWeight.w400
                            ),
                          ),

                          Spacer(),

                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, AppRoutes.resetPasswordScreenRoute);
                            },
                            child: const Text(
                              "Forget Password?",
                              style: TextStyle(
                                color: ColorManager.primaryColor,
                                fontSize: 16.7,
                                fontWeight: FontWeight.w400
                              )
                            ),
                          )
                        ],
                      ),

                      SizedBox(height: 24.h,),

                      SizedBox(
                        height: 27.h,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have an account? ",
                                  style: TextStyle(
                                      color: ColorManager.grey,
                                      fontSize: 19.5,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),

                                TextButton(
                                  child: const Text(
                                    "Register",
                                    style: TextStyle(
                                        color: ColorManager.primaryColor,
                                        fontSize: 19.5,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(context, AppRoutes.registerScreenRoute);
                                  },
                                ),
                              ],
                            ),

                            SizedBox(height: 1.h,),

                            CustomButton(
                              active: true,
                              toDo: () {
                                if (loginKey.currentState!.validate()) {
                                  loginCubit.userLogin(email: emailCtrl.text,password: passwordCtrl.text);
                                  // Navigator.pushReplacementNamed(context, AppRoutes.layoutScreenRoute);
                                }
                                // loginCubit.loginModel!.user!.id!;
                              },
                              child: states is LoginSuccessState
                                  ? const Loading()
                                  : const Center(
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                              ),
                            ),

                            SizedBox(height: 2.h,),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Expanded(child: Divider(thickness: 2)),
                                  Text("    Or Login With Account    ",
                                    style: TextStyle(
                                        color: ColorManager.darkGrey,
                                        fontSize: 19.5,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                  Expanded(child: Divider(thickness: 2)),
                                ]),

                            SizedBox(height: 2.h,),

                            Row(
                              children: [
                                AcountContainer(
                                  account: "Google",
                                  toDo: () {},
                                ),
                                AcountContainer(
                                  account: "Facebook",
                                  toDo: () {},
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
