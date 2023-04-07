import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/view_model/route/router.dart';
import 'package:sizer/sizer.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/padding_manager.dart';
import '../../../../view_model/cubit/auth_cubit/register/register_cubit.dart';
import '../../../../view_model/cubit/auth_cubit/register/register_states.dart';
import '../../../widgets/account_auth.dart';
import '../../../widgets/custom_button/custom_button.dart';
import '../../../widgets/custom_button/loading_button.dart';
import '../../../widgets/cutom_text_form_field.dart';
import 'interested_work.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();

  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (BuildContext context, RegisterState states) {
        if (states is RegisterSuccessState) {
          Navigator.pushReplacementNamed(context, AppRoutes.interestedWorkScreenRoute);
        }
      },
      builder: (BuildContext context, RegisterState states) {
        RegisterCubit registerCubit = RegisterCubit.get(context);

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
            key: registerKey,

            child: Padding(
              padding: PaddingManger.sidePadding,
              child: ListView(
                children: [
                  SizedBox(height: 2.h),

                  Text("Create Account",
                      style: TextStyle(
                          color: ColorManager.darkBlue,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w500
                      )
                  ),

                  SizedBox(height: 1.5.h),

                  const Text(
                    "Please create an account to find your dream job",
                    style: TextStyle(
                      color: ColorManager.darkGrey,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),

                  CustomTextFormField(
                    fieldCtrl: userNameCtrl,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Username';
                      }
                      return null;
                    },
                    fieldIcon: Icons.person_outline_rounded,
                    fieldHint: "Username",
                    fieldInput: TextInputType.name,
                    isSecured: false,
                    withIcon: false,
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),

                  CustomTextFormField(
                    fieldCtrl: emailCtrl,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Email';
                      } else if (!RegExp(
                              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]")
                          .hasMatch(value)) {
                        return 'Please Enter Valid as example@gmail.com';
                      }
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
                    isSecured: registerCubit.showPass,
                    withIcon: true,
                    showPass: () {
                      registerCubit.changePasswordVisibility();
                    },
                  ),

                  SizedBox(height: 25.h,),

                  SizedBox(
                    height: 27.h,
                    child: Column (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account? ",
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

                        SizedBox(height: 1.h,),

                        CustomButton(
                          active: true,
                          toDo: () {
                            if (registerKey.currentState!.validate()) {
                              registerCubit.userRegister(
                                  userName: userNameCtrl.text,
                                  email: emailCtrl.text,
                                  password: passwordCtrl.text);
                            }
                          },
                          child: states is RegisterSuccessState
                              ? const Loading()
                              : const Center(
                                  child: Text(
                                    "Create account",
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
                            ]
                        ),

                        SizedBox(height: 2.h),

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
        );
      },
    );
  }
}
