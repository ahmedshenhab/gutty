import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/app_constant.dart';
import '../../../../core/services/shared_prefrence/cach_helper.dart';
import '../data/model/register_request_model.dart';
import '../data/register_repo.dart';
import 'states.dart';

class RegisterCubit extends Cubit<MealRegisterStates> {
  RegisterCubit({required RegisterRepo registerRepo})
    : _registerRepo = registerRepo,
      super(MealRegisterInitial());

  final RegisterRepo _registerRepo;
  bool isLoading = false;

  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> registerUser() async {
    if (formState.currentState!.validate()) {
      emit(MealRegisterLoadingState());
      final result = await _registerRepo.registerUser(
        RegisterRequestModel(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          middleName: middleNameController.text,
          phoneNumber: phoneNumberController.text,
          password: passwordController.text,
          mainAddress: mainAddressController.text,
          secondaryAddress: '',
          cityId: 0,
        ).toJson(),
      );
      result.fold((l) => emit(MealRegisterErrorState(error: l.message ?? '')), (
        r,
      )async {
        await CachHelper.setData(key: AppConstant.tokenKey, value: r);
        emit(MealRegisterSuccessState());
      });
    }
  }

  // ui

  final formState = GlobalKey<FormState>();

  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final mainAddressController = TextEditingController();

  void clearform() {
    passwordController.clear();
    phoneNumberController.clear();
    firstNameController.clear();
    lastNameController.clear();
    middleNameController.clear();
    mainAddressController.clear();
  }

  @override
  Future<void> close() {
    passwordController.dispose();
    phoneNumberController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    middleNameController.dispose();
    mainAddressController.dispose();

    return super.close();
  }
}
