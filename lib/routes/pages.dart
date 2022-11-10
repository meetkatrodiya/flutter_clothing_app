import 'package:flutter_clothing_app_11/pages/cart/bindings/cart_binding.dart';
import 'package:flutter_clothing_app_11/pages/cart/ui/index.dart';
import 'package:flutter_clothing_app_11/pages/detail/ui/index.dart';
import 'package:flutter_clothing_app_11/pages/home/ui/index.dart';
import 'package:flutter_clothing_app_11/pages/home/ui/widgets/search_box.dart';
import 'package:flutter_clothing_app_11/pages/main/bindings/main_bindings.dart';
import 'package:flutter_clothing_app_11/pages/main/ui/index.dart';
import 'package:flutter_clothing_app_11/pages/search/bindings/search_binding.dart';
import 'package:flutter_clothing_app_11/pages/search/ui/index.dart';
import 'package:flutter_clothing_app_11/routes/routes.dart';
import 'package:get/get.dart';
import 'package:flutter_clothing_app_11/screens/login_screen.dart';

class Pages {
  static final List<GetPage<dynamic>> pages = [
    GetPage<HomePage>(
      name: Routes.initial,
      page: () => const LoginScreen(),
      binding: MainBindings(),
      transition: Transition.fadeIn,
      preventDuplicates: true,
    ),
    GetPage<HomePage>(
      name: Routes.home,
      page: () => HomePage(),
      transition: Transition.fadeIn,
      preventDuplicates: true,
    ),
    GetPage<SearchPage>(
      name: Routes.search,
      page: () => const SearchPage(),
      binding: SearchBinding(),
      transition: Transition.downToUp,
      preventDuplicates: true,
    ),
    GetPage<CartPage>(
      name: Routes.cart,
      page: () => CartPage(),
      binding: CartBindings(),
      transition: Transition.upToDown,
      preventDuplicates: true,
    ),
  ];
}
