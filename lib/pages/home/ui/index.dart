import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_clothing_app_11/core/theme/colors.dart';
import 'package:flutter_clothing_app_11/core/utils/dimesions.dart';
import 'package:flutter_clothing_app_11/pages/cart/controllers/cart_controller.dart';
import 'package:flutter_clothing_app_11/pages/home/ui/widgets/banners.dart';
import 'package:flutter_clothing_app_11/pages/home/ui/widgets/categories.dart';
import 'package:flutter_clothing_app_11/pages/home/ui/widgets/my_text.dart';
import 'package:flutter_clothing_app_11/pages/home/ui/widgets/recent_products.dart';
import 'package:flutter_clothing_app_11/pages/home/ui/widgets/search_box.dart';
import 'package:flutter_clothing_app_11/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../cart/ui/index.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
  final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 3),
                    child: const MyText(
                      text: 'Hello',
                      color: AppColors.text2Color,
                    ),
                  ),
                  const MyText(
                    text: 'Welcome',
                    weight: FontWeight.w500,
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // IconButton(
                  //   padding: EdgeInsets.zero,
                  //   constraints: const BoxConstraints(),
                  //   onPressed: () => Get.toNamed(Routes.cart),
                  //   icon: Badge(
                  //     badgeContent: Obx(
                  //       () => MyText(
                  //         text: Get.find<CartController>()
                  //             .items
                  //             .length
                  //             .toString(),
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //     child: SvgPicture.asset('assets/icons/Buy.svg'),
                  //   ),
                  //   iconSize: Dimensions.iconSize26,
                  // ),
                  SizedBox(
                    width: Dimensions.width15,
                  ),
                  IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage())),
                    icon: SvgPicture.asset('assets/icons/Buy.svg', ),
                    iconSize: Dimensions.iconSize26,
                    padding: EdgeInsets.only(top:22, right: 10),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: ()async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset('assets/icons/logout.svg'),
                    iconSize: 22,
                  )
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () => Get.toNamed(Routes.search),
            child: SearchBox(
              isEnabled: false,
            ),
          ),
          Banners(),
          const Categories(),
          RecentProduct(),
        ],
      ),
    );
  }
}
