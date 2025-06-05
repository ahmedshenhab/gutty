

abstract class MealRegisterStates {}

class MealRegisterInitial extends MealRegisterStates {}

class MealRegisterLoadingState extends MealRegisterStates {}

class MealRegisterSuccessState extends MealRegisterStates {}

class MealRegisterErrorState extends MealRegisterStates {
  MealRegisterErrorState({required this.error});

  final String error;
}
