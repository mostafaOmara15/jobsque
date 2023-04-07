import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/jobs/suggested_jobs_model.dart';
import 'package:jobsque/view_model/constants/end_points.dart';
import 'package:jobsque/view_model/cubit/job_cubit/suggested_job_cubit/suggested_job_states.dart';
import 'package:jobsque/view_model/data/remote/dio_helper.dart';
import '../../../data/local/cache_helper.dart';

class SuggestedJobCubit extends Cubit <SuggestedJobStates> {
  SuggestedJobCubit(): super(SuggestedJobInitialState());

  static SuggestedJobCubit get(context) => BlocProvider.of(context);

  bool saved = false;
  List<JobData>? suggestedJobsList;
  SuggestedJobModel? suggestedJobs;

  void onSaveTapped() {
    if(saved == false)
    {
      saved = true;
      emit(SuggestedJobSavedState());
    } else {
      saved = false;
      emit(SuggestedJobUnSavedState());
    }
  }

  void getSuggestedJobs({required int? id, required String? token}){
    emit(SuggestedJobLoadingState());
    DioHelper.getData(
      endPoint: '${EndPoint.suggestedJob}/$id',
      token: token
    ).then((value) {
        suggestedJobs = SuggestedJobModel.fromJson(value.data);
        // print("000000000000000000000000000000000000000");
        // print(value.data);
        // // print(suggestedJobs!.status);
         suggestedJobsList = suggestedJobs?.data;
         print(suggestedJobsList);
         emit(SuggestedJobSuccessState());
    }
    ).catchError((error){
      print("A7a");
      print(error.toString());
      emit(SuggestedJobErrorState());
    });

  }

}