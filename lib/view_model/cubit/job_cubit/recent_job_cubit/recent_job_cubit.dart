import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/view_model/cubit/job_cubit/recent_job_cubit/recent_job_state.dart';
import '../../../../model/jobs/recent_jobs_model.dart';
import '../../../constants/end_points.dart';
import '../../../data/remote/dio_helper.dart';

class RecentJobCubit extends Cubit <RecentJobStates> {
  RecentJobCubit(): super(RecentJobInitialState());

  static RecentJobCubit get(context) => BlocProvider.of(context);

  bool saved = false;
  List<RecentJobData>? recentJobsList;
  RecentJobsModel? recentJobs;

  void onSaveTapped() {
    if(saved == false)
    {
      saved = true;
      emit(RecentJobSavedState());
    } else {
      saved = false;
      emit(RecentJobUnSavedState());
    }
  }

  void getRecentJobs({required String token}){
    emit(RecentJobLoadingState());
    DioHelper.getData(
        endPoint: '${EndPoint.recentJob}',
        token: token
    ).then((value) {
      recentJobs = RecentJobsModel.fromJson(value.data);
      recentJobsList = recentJobs?.data;
      print(recentJobsList);
      emit(RecentJobSuccessState());
    }
    ).catchError((error){
      print(error.toString());
      emit(RecentJobErrorState());
    });

  }

}