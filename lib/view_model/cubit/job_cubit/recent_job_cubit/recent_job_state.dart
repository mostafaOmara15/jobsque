abstract class RecentJobStates{}

class RecentJobInitialState extends RecentJobStates{}

class RecentJobSavedState extends RecentJobStates{}

class RecentJobUnSavedState extends RecentJobStates{}

// class RecentJobLoadingState extends SuggestedJobStates{}
//
// class RecentJobSuccessState extends SuggestedJobStates{
//   static List<SuggestedJobs>? suggestedJobs;
//   SuggestedJobSuccessState(List<SuggestedJobs> jobs){
//     suggestedJobs = jobs;
//   }
// }
//
// class RecentJobErrorState extends SuggestedJobStates{}