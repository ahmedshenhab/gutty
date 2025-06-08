import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/module/detail_screen/widget/appbar_details_screen.dart';
import '../../core/ui/style/app_text_style.dart';
import 'widget/ingrediant_list.dart';
import 'widget/static_content.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.map, });
  static const routeName = '/detail-screen';
  final Map<String,String> map;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Appbar
          const AppbarDetailsScreen(),

          // Static content section
           StaticContent(map: map,),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                top: 16.h,
                bottom: 16.h,
                start: 16.w,
              ),
              child: Text('Ingredients', style: AppTextStyle.font18Medium),
            ),
          ),

          // Ingredients list
          SliverPadding(
            padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.w),
            sliver: const IngrediantList(),
          ),
        ],
      ),
    );
  }
}
