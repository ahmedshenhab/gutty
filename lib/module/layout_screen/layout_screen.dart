import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gutty/core/ui/style/app_color.dart';
import 'package:gutty/core/ui/style/app_text_style.dart';
import 'package:gutty/module/layout_screen/widget/home/home_layout.dart';
import 'package:gutty/module/layout_screen/widget/menu/cubit/menu_cubit.dart';
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
    List<Widget> screens = [
      const HomeLayout(),

      BlocProvider(create: (context) => MenuCubit(), child: const MenuLayout()),
      const SubscriptionLayout(),
    ];
    List<PreferredSizeWidget?> appBars = [
      // AppBar(
      //   centerTitle: true,
      //   scrolledUnderElevation: 0,
      //   actions: [
      //     IconButton(
      //       style: Theme.of(context).iconButtonTheme.style,
      //       onPressed: () {},
      //       icon: const Icon(Icons.person_outline),
      //     ),
      //   ],
      //   title: Transform.translate(
      //     offset: Offset(0, 6.h),
      //     child: SvgPicture.asset(
      //       'assets/images/svg/logo.svg',
      //       width: 181.w,
      //       height: 101.h,
      //     ),
      //   ),
      //   bottom: PreferredSize(
      //     preferredSize: const Size.fromHeight(0), // Height of the line
      //     child: Container(
      //       color: AppColor.grey, // Line color
      //       height: 1.h, // Thickness of the line
      //     ),
      //   ),
      // ),
      null,
      AppBar(
        scrolledUnderElevation: 0,

        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Text(
            'meals',
            style: AppTextStyle.font24Bold.copyWith(color: AppColor.primary),
          ),
        ),
      ),
      AppBar(title: const Text('Subscription')),
    ];
    return Scaffold(
      appBar: appBars[index],
      body: SafeArea(child: screens[index]),

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
