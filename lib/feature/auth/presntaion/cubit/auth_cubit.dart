import 'package:bloc/bloc.dart';
import 'package:bookia/feature/auth/data/model/auth_params.dart';
import 'package:bookia/feature/auth/data/repo/auth_repo.dart';
import 'package:bookia/feature/auth/presntaion/cubit/auth_state.dart';
import 'package:flutter/material.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
    var formkey=GlobalKey<FormState>();
   var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var confirapasswordcontroller = TextEditingController();


  register() async {
    emit(AuthLoadingState());
    var res =await AuthRepo.register(AuthParams(
      name: namecontroller.text,
      email: emailcontroller.text,
      password: passwordcontroller.text,
      confirmpassword: confirapasswordcontroller.text
    ));
    if(res!=null){
      emit(AuthSuccesState());
    }else{
      emit(AuthErrorState());
    }

  }
}