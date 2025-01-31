import 'package:flutter/cupertino.dart';

class AppState extends ChangeNotifier{
  int selectedCategoryid = 0;

  void changeSelected(int index){
    selectedCategoryid = index;
    notifyListeners();
  }
}