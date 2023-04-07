import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/view_model/data/local/cache_helper.dart';
import '../../../../model/auth/login_model.dart';
import '../../../constants/end_points.dart';
import '../../../data/remote/dio_helper.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool showPass = true;
  bool isChecked = false;
  bool isActive = false;
  static LoginModel loginModel = LoginModel();

  void changePasswordVisibility() {
    showPass = !showPass;
    emit(PasswordVisibilityState());
  }

  void changeCheck(value) {
    isChecked = value;
    emit(ChangeCheckState());
  }

  void userLogin({required String? email, required String password})
  {
    emit(LoginLoadingState());
    DioHelper.postData(
      endPoint: EndPoint.login,
      data: {
        'email': email,
        'password': password,
      },
      // token: EndPoint.userToken
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      EndPoint.userId = loginModel!.user!.id!;
      EndPoint.userToken = loginModel!.token!;
      CacheHelper.setString("userToken", loginModel!.token!);
      CacheHelper.setString("userName", loginModel!.user!.name!);
      CacheHelper.setInt("userId", loginModel!.user!.id!);
      emit(LoginSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState());
    });
  }
}
