import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'interested_work_states.dart';

class InterestedWorkCubit extends Cubit<InterestedWorkStates> {
  InterestedWorkCubit() : super(InitialInterestedWork());

  static InterestedWorkCubit get(context) => BlocProvider.of(context);

  List<String> interestedWork = [];

  bool UI_UX_designer = false;
  bool illustratorDesigner = false;
  bool developer = false;
  bool management = false;
  bool informationTechnology = false;
  bool researchAnalytics = false;

  void selectUi_UX_Designer() {
    UI_UX_designer = !UI_UX_designer;
    if(UI_UX_designer == true){
      interestedWork.add("UI/UX Designer");
    }
    else {
      interestedWork.remove("UI/UX Designer");
    }
    emit(SelectInterestedWork());
  }
  void selectIllustratorDesigner() {
    illustratorDesigner = !illustratorDesigner;
    if(illustratorDesigner == true){
      interestedWork.add("Illustrator Designer");
    }
    else {
      interestedWork.remove("UI/UX Designer");
    }
    emit(SelectInterestedWork());
  }
  void selectDeveloper() {
    developer = !developer;
    if(developer == true){
      interestedWork.add("Developer");
    }
    else {
      interestedWork.remove("Developer");
    }
    emit(SelectInterestedWork());
  }
  void selectManagement() {
    management = !management;
    if(management == true){
      interestedWork.add("Management");
    }
    else {
      interestedWork.remove("Management");
    }
    emit(SelectInterestedWork());
  }
  void selectInformationTechnology() {
    informationTechnology = !informationTechnology;
    if(informationTechnology == true){
      interestedWork.add("Information Technology");
    }
    else {
      interestedWork.remove("Information Technology");
    }
    emit(SelectInterestedWork());
  }
  void selectResearchAnalytics() {
    researchAnalytics = !researchAnalytics;
    if(researchAnalytics == true){
      interestedWork.add("Research Analytics");
    }
    else {
      interestedWork.remove("Research Analytics");
    }
    emit(SelectInterestedWork());
  }
}
