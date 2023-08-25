import 'package:e_commerce_app/data/firebase_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationWayViewModel extends Cubit<AuthenticationWayViewState> {
  AuthenticationWayViewModel() : super(InitState());

  Future<void> signInWithFacebook() async {
    emit(LoadingState());
    try {
      var user = await FirebaseManager.signInWithFacebook();
      emit(SuccessState());
    } catch (ex) {
      print("exception: $ex");
      emit(ErrorState());
    }
  }

  // Future<void> signInWithTwitter() async {
  //   emit(LoadingState());
  //   try {
  //     await FirebaseManager.signInWithTwitter();
  //     emit(SuccessState());
  //   } catch (ex) {
  //     print("exception: $ex");
  //     emit(ErrorState());
  //   }
  // }

  // Future<void> signInWithGoogle() async {
  //   emit(LoadingState());
  //   try {
  //     await FirebaseManager.signInWithGoogle();
  //     emit(SuccessState());
  //   } catch (ex) {
  //     print("exception: $ex");
  //     emit(ErrorState());
  //   }
  // }
}

abstract class AuthenticationWayViewState {}

class InitState extends AuthenticationWayViewState {}

class LoadingState extends AuthenticationWayViewState {}

class SuccessState extends AuthenticationWayViewState {}

class ErrorState extends AuthenticationWayViewState {}
