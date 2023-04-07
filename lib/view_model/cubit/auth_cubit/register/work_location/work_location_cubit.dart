import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/auth/update_profile.dart';
import 'package:jobsque/view_model/cubit/auth_cubit/register/work_location/work_lacation_states.dart';
import '../../../../constants/end_points.dart';
import '../../../../data/local/cache_helper.dart';
import '../../../../data/remote/dio_helper.dart';

class WorkLocationCubit extends Cubit<WorkLocationStates> {
  WorkLocationCubit() : super(InitialWorkLocation());

  static WorkLocationCubit get(context) => BlocProvider.of(context);

  UpdateProfileModel? updateProfileModel;

  int index = 0;
  List<String> offlinePlaces = [];
  List<String> remotePlaces = [];

  bool unitedStates = false;
  bool malaysia = false;
  bool singapore = false;
  bool indonesia = false;
  bool philippines = false;
  bool poland = false;
  bool india = false;
  bool vietnam = false;
  bool china = false;
  bool canada = false;
  bool saudiArabia = false;
  bool argentina = false;
  bool brazil = false;

  void updatingProfile({required String interestedWork, required String offlinePlaces, required String remotePlaces}){
    emit(UpdateProfileLoadingStates());
    print(CacheHelper.getString("userToken"));
    print(CacheHelper.getString("userName"));
    print(CacheHelper.getInt("userId"));

    DioHelper.putData(
      endPoint: '${EndPoint.profile}/${CacheHelper.getInt("userId")}',
      data: {
        "intersted_work": interestedWork,
        "offline_place" : offlinePlaces,
        "remote_place" : remotePlaces
      },
       token: CacheHelper.getString("userToken"),
    ).then((value) {
      updateProfileModel = UpdateProfileModel.fromJson(value.data);
      // print(value.data);
      emit(UpdateProfileSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(UpdateProfileErrorStates());
    });
  }

  void selectSite(value){
    index = value;

    unitedStates = false;
    malaysia = false;
    singapore = false;
    indonesia = false;
    philippines = false;
    poland = false;
    india = false;
    vietnam = false;
    china = false;
    canada = false;
    saudiArabia = false;
    argentina = false;
    brazil = false;

    emit(SelectSiteState());
  }

  void selectUnitedStates() {
    unitedStates = !unitedStates;

    if(unitedStates == true){
      if(index == 0){
        offlinePlaces.add("United States");
      }
      else{
        remotePlaces.add("United States");
      }
    }
    else{
      if(index == 0){
        offlinePlaces.remove("United States");
      }
      else{
        remotePlaces.remove("United States");
      }
    }
    emit(SelectWorkLocation());
  }
  void selectMalaysia() {
    malaysia = !malaysia;

    if(malaysia == true){
      if(index == 0){
        offlinePlaces.add("Malaysia");
      }
      else{
        remotePlaces.add("Malaysia");
      }
    }
    else{
      if(index == 0){
        offlinePlaces.remove("Malaysia");
      }
      else{
        remotePlaces.remove("Malaysia");
      }
    }

    emit(SelectWorkLocation());
  }
  void selectSingapore() {
    singapore = !singapore;

    if(singapore == true){
      if(index == 0){
        offlinePlaces.add("Singapore");
      }
      else{
        remotePlaces.add("Singapore");
      }
    }
    else{
      if(index == 0){
        offlinePlaces.remove("Singapore");
      }
      else{
        remotePlaces.remove("Singapore");
      }
    }
    emit(SelectWorkLocation());
  }
  void selectIndonesia() {
    indonesia = !indonesia;
    if(indonesia == true){
      if(index == 0){
        offlinePlaces.add("Indonesia");
      }
      else{
        remotePlaces.add("Indonesia");
      }
    }
    else{
      if(index == 0){
        offlinePlaces.remove("Indonesia");
      }
      else{
        remotePlaces.remove("Indonesia");
      }
    }
    emit(SelectWorkLocation());
  }
  void selectPhilippines() {
    philippines = !philippines;

    if(philippines == true){
      if(index == 0){
        offlinePlaces.add("Philippines");
      }
      else{
        remotePlaces.add("Philippines");
      }
    }
    else{
      if(index == 0){
        offlinePlaces.remove("Philippines");
      }
      else{
        remotePlaces.remove("Philippines");
      }
    }
    emit(SelectWorkLocation());
  }
  void selectPoland() {
    poland = !poland;

    if(poland == true){
      if(index == 0){
        offlinePlaces.add("Poland");
      }
      else{
        remotePlaces.add("Poland");
      }
    }
    else{
      if(index == 0){
        offlinePlaces.remove("Poland");
      }
      else{
        remotePlaces.remove("Poland");
      }
    }
    emit(SelectWorkLocation());
  }
  void selectIndia() {
    india = !india;
    if(india == true){
      if(index == 0){
        offlinePlaces.add("India");
      }
      else{
        remotePlaces.add("India");
      }
    }
    else{
      if(index == 0){
        offlinePlaces.remove("India");
      }
      else{
        remotePlaces.remove("India");
      }
    }
    emit(SelectWorkLocation());
  }
  void selectVietnam() {
    vietnam = !vietnam;
    if(vietnam == true){
      if(index == 0){
        offlinePlaces.add("Vietnam");
      }
      else{
        remotePlaces.add("Vietnam");
      }
    }
    else{
      if(index == 0){
        offlinePlaces.remove("Vietnam");
      }
      else{
        remotePlaces.remove("Vietnam");
      }
    }
    emit(SelectWorkLocation());
  }
  void selectChina() {
    china = !china;

    if(china == true){
      if(index == 0){
        offlinePlaces.add("China");
      }
      else{
        remotePlaces.add("China");
      }
    }
    else{
      if(index == 0){
        offlinePlaces.remove("China");
      }
      else{
        remotePlaces.remove("China");
      }
    }
    emit(SelectWorkLocation());
  }
  void selectCanada() {
    canada = !canada;
    if(canada == true){
      if(index == 0){
        offlinePlaces.add("Canada");
      }
      else{
        remotePlaces.add("Canada");
      }
    }
    else{
      if(index == 0){
        offlinePlaces.remove("Canada");
      }
      else{
        remotePlaces.remove("Canada");
      }
    }
    emit(SelectWorkLocation());
  }
  void selectSaudiArabia() {
    saudiArabia = !saudiArabia;
    if(saudiArabia == true){
      if(index == 0){
        offlinePlaces.add("SaudiArabia");
      }
      else{
        remotePlaces.add("SaudiArabia");
      }
    }
    else{
      if(index == 0){
        offlinePlaces.remove("SaudiArabia");
      }
      else{
        remotePlaces.remove("SaudiArabia");
      }
    }
    emit(SelectWorkLocation());
  }
  void selectArgentina() {
    argentina = !argentina;

    if(argentina == true){
      if(index == 0){
        offlinePlaces.add("Argentina");
      }
      else{
        remotePlaces.add("Argentina");
      }
    }
    else{
      if(index == 0){
        offlinePlaces.remove("Argentina");
      }
      else{
        remotePlaces.remove("Argentina");
      }
    }
    emit(SelectWorkLocation());
  }
  void selectBrazil() {
    brazil = !brazil;

    if(brazil == true){
      if(index == 0){
        offlinePlaces.add("Brazil");
      }
      else{
        remotePlaces.add("Brazil");
      }
    }
    else{
      if(index == 0){
        offlinePlaces.remove("Brazil");
      }
      else{
        remotePlaces.remove("Brazil");
      }
    }
    emit(SelectWorkLocation());
  }
}
