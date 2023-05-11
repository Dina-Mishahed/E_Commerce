import 'package:e_commerce/core/view%20model/auth_view_model.dart';
import 'package:e_commerce/core/view%20model/control_view_model.dart';
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:e_commerce/view/home_view.dart';
import 'package:e_commerce/view/widgets/cart_view.dart';
import 'package:e_commerce/view/widgets/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ControlView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<ControlViewModel>(
              builder: (controller) => Scaffold(
                body: controller.currenScreen,
                bottomNavigationBar: _bottomNavigationBar(),
              ),
            );
    });
  }

  Widget _bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: '',
            activeIcon: Padding(
                padding: EdgeInsets.only(top: 25.0), child: Text('Explor')),
            icon: Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Image.asset(
                'assets/images/explor_icon.png',
                fit: BoxFit.contain,
                width: 30,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            activeIcon: Padding(
                padding: EdgeInsets.only(top: 25.0), child: Text('Cart')),
            icon: Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Image.asset(
                'assets/images/cart_icon.png',
                fit: BoxFit.contain,
                width: 30,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            activeIcon: Padding(
                padding: EdgeInsets.only(top: 25.0), child: Text('Account')),
            icon: Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Image.asset(
                'assets/images/person_icon.png',
                fit: BoxFit.contain,
                width: 30,
              ),
            ),
          ),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.white,
      ),
    );
  }
}
