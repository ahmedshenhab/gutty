import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuInitial());
  static MenuCubit get(BuildContext context) => BlocProvider.of(context);
  int currentCategory = 0;

  final List<String> categories = ['all', 'breakfast', 'lunch', 'dinner'];

  void changeCategory(int index) {
    if (index == currentCategory) {
      return;
    }
    else{
      currentCategory = index;
          emit(ChangeCategoryIndexState());

    
    }
  }
}
