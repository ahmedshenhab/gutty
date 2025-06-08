import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gutty/module/layout_screen/widget/menu/data/model/meal_menu_model.dart';
import 'package:gutty/module/layout_screen/widget/menu/data/repo/repo_menu.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit({required RepoMenu repoMenu})
    : _repoMenu = repoMenu,
      super(MenuInitial());
  final RepoMenu _repoMenu;
  static MenuCubit get(BuildContext context) => BlocProvider.of(context);
  int currentCategory = 0;

  final List<String> categories = ['all', 'breakfast', 'lunch', 'dinner'];

  Future<void> searchByName(String name) async {
    if (name.isEmpty) {
      return ;
    }
    else{
       emit(MenuLoadingState());

      final result = await _repoMenu.searchByName(name);
      result.fold(
        (l) => emit(MenuErrorState(error: l.message ?? '')),
        (r) => emit(MenuSuccessState(meals: r)),
      );
    
    }
  }

  void changeCategory(int index) {
    if (index == currentCategory) {
      return;
    } else {
      currentCategory = index;
      emit(ChangeCategoryIndexState());
    }
  }

  late TextEditingController searchController;

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}
