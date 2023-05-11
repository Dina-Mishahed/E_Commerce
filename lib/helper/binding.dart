
import 'package:e_commerce/core/view%20model/control_view_model.dart';
import 'package:e_commerce/core/view%20model/home_view_model.dart';
import 'package:e_commerce/view/home_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../core/view model/auth_view_model.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    //Get.put(HomeViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
  }

}