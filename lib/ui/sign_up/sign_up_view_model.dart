import 'package:e_commerce_app/data/firebase_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../custom_exception/internet_exception/no_internet.dart';
import '../../custom_exception/sign_up_exceptions/email_already_in_use.dart';
import '../../custom_exception/sign_up_exceptions/weak_password.dart';

class SignUpViewModel extends Cubit<SignUpViewState> {
  SignUpViewModel() : super(InitState());

  Future<void> signUp(
      String userName, String email, String password, bool rememberMe) async {
    emit(LoadingState());
    try {
      await FirebaseManager.signUp(userName, email, password, rememberMe);
      emit(SuccessState());
    } catch (exception) {
      if (exception is EmailAlreadyInUse) {
        emit(ErrorState(errorMessage: "email is already in use"));
        return;
      }
      if (exception is WeakPassword) {
        emit(ErrorState(errorMessage: "weak password"));
        return;
      }
      if (exception is NoInternet) {
        emit(ErrorState(errorMessage: "No internet connection"));
        return;
      }
      emit(ErrorState(errorMessage: "something went wrong"));
    }
  }
}

abstract class SignUpViewState {}

class InitState extends SignUpViewState {}

class LoadingState extends SignUpViewState {}

class SuccessState extends SignUpViewState {}

class ErrorState extends SignUpViewState {
  String errorMessage;

  ErrorState({required this.errorMessage});
}
