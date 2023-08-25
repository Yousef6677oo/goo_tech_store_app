import 'package:e_commerce_app/data/firebase_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../custom_exception/internet_exception/no_internet.dart';
import '../../custom_exception/sign_in_exceptions/user_not_found.dart';
import '../../custom_exception/sign_in_exceptions/wrong_password.dart';

class SignInViewModel extends Cubit<SignInViewState> {
  SignInViewModel() : super(InitState());

  Future<void> signIn(String email, String password, bool rememberMe) async {
    emit(LoadingState());
    try {
      await FirebaseManager.signIn(email, password, rememberMe);
      emit(SuccessState());
    } catch (exception) {
      if (exception is UserNotFound) {
        emit(ErrorState(errorMessage: "email is wrong."));
        return;
      }
      if (exception is WrongPassword) {
        emit(ErrorState(errorMessage: "password is wrong."));
        return;
      }
      if (exception is NoInternet) {
        emit(ErrorState(errorMessage: "No internet connection"));
        return;
      }
    }
  }
}

abstract class SignInViewState {}

class InitState extends SignInViewState {}

class LoadingState extends SignInViewState {}

class SuccessState extends SignInViewState {}

class ErrorState extends SignInViewState {
  String errorMessage;

  ErrorState({required this.errorMessage});
}
