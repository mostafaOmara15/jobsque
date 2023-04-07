// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class RecentJobCardCubit extends Cubit <RecentJobCardStates> {
//   RecentJobCardCubit(): super(RecentJobInitialState());
//
//   static RecentJobCardCubit get(context) => BlocProvider.of(context);
//
//   bool saved = false;
//
//   void onSaveTapped() {
//     if(saved == false)
//     {
//       saved = true;
//       emit(RecentJobSavedState());
//     } else {
//       saved = false;
//       emit(RecentJobUnSavedState());
//     }
//   }
//
// }