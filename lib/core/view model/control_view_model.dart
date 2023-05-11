import 'package:e_commerce/view/widgets/cart_view.dart';
import 'package:e_commerce/view/widgets/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../view/home_view.dart';

class ControlViewModel extends GetxController {
  Widget _currentScreen = HomeView();

  get currenScreen => _currentScreen;
  int _navigatorvalue = 0;

  get navigatorValue => _navigatorvalue;

  void changeSelectedValue(int selectedValue) {
    _navigatorvalue = selectedValue;
    switch (_navigatorvalue) {
      case 0:
        _currentScreen = HomeView();
        break;
      case 1:
        _currentScreen = CartView();
        break;
      case 2:
        _currentScreen = ProfileView();
        break;
    }
    update();
  }
}
