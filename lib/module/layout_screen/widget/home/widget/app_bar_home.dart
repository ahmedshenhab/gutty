import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gutty/core/ui/style/app_color.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      scrolledUnderElevation: 0,

      // pinned: true,
      expandedHeight: 0,
      floating: true,
      actions: [
        IconButton(
          style: Theme.of(context).iconButtonTheme.style,
          onPressed: () {},
          icon: const Icon(Icons.person_outline),
        ),
      ],
      title: Transform.translate(
        offset: Offset(0, 6.h),
        child: SvgPicture.asset(
          'assets/images/svg/logo.svg',
          width: 181.w,
          height: 101.h,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(color: AppColor.grey, height: 1.h),
      ),
    );
  }
}
