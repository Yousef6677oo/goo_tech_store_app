import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewModel extends Cubit<HomeViewState> {
  HomeViewModel() : super(InitState());
}

abstract class HomeViewState {}

class InitState extends HomeViewState {}

class LoadingState extends HomeViewState {}

class SuccessState extends HomeViewState {}

class ErrorState extends HomeViewState {
  String errorMessage;

  ErrorState({required this.errorMessage});
}
