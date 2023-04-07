import '../../../../model/jobs/suggested_jobs_model.dart';

abstract class SuggestedJobStates{}

class SuggestedJobInitialState extends SuggestedJobStates{}

class SuggestedJobSavedState extends SuggestedJobStates{}

class SuggestedJobUnSavedState extends SuggestedJobStates{}

class SuggestedJobLoadingState extends SuggestedJobStates{}

class SuggestedJobSuccessState extends SuggestedJobStates {
  // static List<JobData>? jobs;
  // SuggestedJobSuccessState(List<JobData>? suggestedJobs){
  //   jobs = suggestedJobs;
  // }
}


class SuggestedJobErrorState extends SuggestedJobStates{}