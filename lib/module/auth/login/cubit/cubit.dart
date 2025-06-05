import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gutty/core/app_constant.dart';
import 'package:gutty/core/services/shared_prefrence/cach_helper.dart';
import '../data/model/login_request/login_request_model.dart';
import '../data/repo/login_repo.dart';
import 'states.dart';

class LoginCubit extends Cubit<MealLoginStates> {
  LoginCubit({required LoginRepo loginRepo})
    : _loginRepo = loginRepo,
      super(MealLoginIntialState());

  final LoginRepo _loginRepo;
  bool isLoading = false;

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  void loginUser() async {
    if (formState.currentState!.validate()) {
      emit(MealLoginLoadingState());

      final result = await _loginRepo.loginUser(
        LoginRequestModel(
          phoneNumber: phoneNumberController.text,
          password: passwordController.text,
        ).toJson(),
      );
      result.fold(
        (l) {
          emit(MealLoginErrorState(error: l.message ?? ''));
        },
        (r)async {
                 await   CachHelper.setData(key: AppConstant.tokenKey, value: r);

          emit(MealLoginSuccessState());
          
        },
      );
    }
  }

  // ui

  final formState = GlobalKey<FormState>();

  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();

  void clearform() {
    passwordController.clear();
    phoneNumberController.clear();
  }

  @override
  Future<void> close() {
    passwordController.dispose();
    phoneNumberController.dispose();
    return super.close();
  }
}
