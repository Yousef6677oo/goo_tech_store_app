import 'package:e_commerce_app/data/firebase_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseWayToAuthenticateViewModel
    extends Cubit<ChooseWayToAuthenticateViewState> {
  ChooseWayToAuthenticateViewModel() : super(InitState());

  Future<void> signInWithFacebook() async {
    emit(LoadingState());
    try {
      var user = await FirebaseManager.signInWithFacebook();
      print("ggggggggggggg: ${user.user?.email}");
      emit(SuccessState());
    } catch (ex) {
      print("exception: $ex");
      emit(ErrorState());
    }
  }

  Future<void> signInWithTwitter() async {
    emit(LoadingState());
    try {
      await FirebaseManager.signInWithTwitter();
      emit(SuccessState());
    } catch (ex) {
      print("exception: $ex");
      emit(ErrorState());
    }
  }

  Future<void> signInWithGoogle() async {
    emit(LoadingState());
    try {
      await FirebaseManager.signInWithGoogle();
      emit(SuccessState());
    } catch (ex) {
      print("exception: $ex");
      emit(ErrorState());
    }
  }
}

abstract class ChooseWayToAuthenticateViewState {}

class InitState extends ChooseWayToAuthenticateViewState {}

class LoadingState extends ChooseWayToAuthenticateViewState {}

class SuccessState extends ChooseWayToAuthenticateViewState {}

class ErrorState extends ChooseWayToAuthenticateViewState {}
