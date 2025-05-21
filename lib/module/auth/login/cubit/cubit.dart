import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/model/login_request/login_model_request.dart';
import '../data/repo/login_repo.dart';
import 'states.dart';

class LoginCubit extends Cubit<MealLoginStates> {
  LoginCubit({required LoginRepo loginRepo})
    : _loginRepo = loginRepo,
      super(MealLoginIntialState());

  final LoginRepo _loginRepo;
  bool  isLoading = false;

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);
  

  void loginUser() async {
    if (!formState.currentState!.validate()) {
      
    }
    emit(MealLoginLoadingState());

    final result = await _loginRepo.loginUser(
      LoginModelRequest(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    result.fold(
      (l) {
        emit(MealLoginErrorState(error: l.message));
      },
      (r) {
        emit(MealLoginSuccessState(loginModelResponse: r));
      },
    );
  }

 

  // ui

  final formState = GlobalKey<FormState>();
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = true;

  void clearform() {
   
    emailController.clear();
    passwordController.clear();
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}




