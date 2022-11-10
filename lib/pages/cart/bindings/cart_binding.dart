import 'package:flutter_clothing_app_11/pages/cart/controllers/cart_controller.dart';
import 'package:get/get.dart';

class CartBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}