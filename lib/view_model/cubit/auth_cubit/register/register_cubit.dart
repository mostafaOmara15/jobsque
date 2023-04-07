import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/view_model/cubit/auth_cubit/register/register_states.dart';
import '../../../../model/auth/register_model.dart';
import '../../../constants/end_points.dart';
import '../../../data/local/cache_helper.dart';
import '../../../data/remote/dio_helper.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool showPass = true;
  bool isActive = false;
  RegisterModel? registerModel;

  /// function to change password visibility
  void changePasswordVisibility() {
    showPass = !showPass;
    emit(PasswordVisibilityState());
  }

  void userRegister({required String userName, required String email, required String password})
  {
    emit(RegisterLoadingState());
    DioHelper.postData(
      endPoint: EndPoint.register,
      data: {
        'name': userName,
        'email': email,
        'password': password,
      },
    ).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      CacheHelper.setString("userToken", registerModel!.token!);
      CacheHelper.setString("userName", registerModel!.data!.name!);
      CacheHelper.setInt("userId", registerModel!.profile!.userId!);
      emit(RegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState());
    });
  }
}

// options:Options(
// receiveDataWhenStatusError: true,
// followRedirects: false,
// validateStatus: (status)=> true,
// headers: {
// 'Content-Type': 'application/json',
// 'Accept': 'application/json',
// },
// receiveTimeout: const Duration(seconds: 60),
// ),);

