part of 'menu_cubit.dart';


sealed class MenuState {}

final class MenuInitial extends MenuState {
 
}

final class MenuLoadingState extends MenuState {  

 
}

final class MenuSuccessState extends MenuState {  

  MenuSuccessState({required this.meals});
  final List<MealMenuModel> meals;
}

final class MenuErrorState extends MenuState {
  MenuErrorState({required this.error});
  final String error;
}


final class ChangeCategoryIndexState extends MenuState {
  ChangeCategoryIndexState();

   
}
