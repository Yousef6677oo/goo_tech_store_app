import 'package:e_commerce_app/data/firebase_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordViewModel extends Cubit<ForgotPasswordViewState> {
  ForgotPasswordViewModel() : super(InitState());

  Future<void> sendPasswordResetEmail(String email) async {
    emit(LoadingState());
    try {
      await FirebaseManager.sendPasswordResetEmail(email);
      emit(SuccessState());
    } catch (exception) {
      print(exception.toString());
      emit(ErrorState(errorMessage: "something went wrong"));
    }
  }
}

abstract class ForgotPasswordViewState {}

class InitState extends ForgotPasswordViewState {}

class LoadingState extends ForgotPasswordViewState {}

class SuccessState extends ForgotPasswordViewState {}

class ErrorState extends ForgotPasswordViewState {
  String errorMessage;

  ErrorState({required this.errorMessage});
}
