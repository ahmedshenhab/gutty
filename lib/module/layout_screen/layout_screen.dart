import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/core/ui/style/app_color.dart';
import 'package:gutty/core/ui/style/app_text_style.dart';
import 'package:gutty/module/layout_screen/widget/home_layout.dart';
import 'package:gutty/module/layout_screen/widget/menu/menu_layout.dart';
import 'package:gutty/module/layout_screen/widget/subscription_layout.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});
  static const routeName = '/layout-screen';

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    List screens = [
      const HomeLayout(),

      const MenuLayout(),
      const SubscriptionLayout(),
    ];
    return Scaffold(
      body: screens[index],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,

        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        unselectedItemColor: AppColor.slateGrey,
        onTap: (value) {
          index = value;

          setState(() {});
        },
        currentIndex: index,
        selectedItemColor: AppColor.primary,

        backgroundColor: AppColor.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'menu'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'subscription',
          ),
        ],
      ),
    );
  }
}
