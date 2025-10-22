import 'package:bloc/bloc.dart';
import 'package:bookia/feature/auth/data/model/auth_params.dart';
import 'package:bookia/feature/auth/data/repo/auth_repo.dart';
import 'package:bookia/feature/auth/presntaion/cubit/auth_state.dart';
import 'package:flutter/material.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  var formkey = GlobalKey<FormState>();
  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var confirapasswordcontroller = TextEditingController();

  register() async {
    emit(AuthLoadingState());
    var res = await AuthRepo.register(
      AuthParams(
        name: namecontroller.text,
        email: emailcontroller.text,
        password: passwordcontroller.text,
        confirmpassword: confirapasswordcontroller.text,
      ),
    );
    if (res != null) {
      emit(AuthSuccesState());
    } else {
      emit(AuthErrorState(message: "registeation failed !"));
    }
  }

  login() async {
    emit(AuthLoadingState());
    var res = await AuthRepo.login(
      AuthParams(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      ),
    );
    if (res != null) {
      emit(AuthSuccesState());
    } else {
      emit(AuthErrorState(message: "login failed !"));
    }
  }

  forgetPassword() async {
    emit(AuthLoadingState());
    var res = await AuthRepo.forgetPassword(
      AuthParams(email: emailcontroller.text),
    );
    if (res != null) {
      emit(AuthSuccesState());
    } else {
      emit(AuthErrorState(message: "forgetpassword failed !"));
    }
  }
}
