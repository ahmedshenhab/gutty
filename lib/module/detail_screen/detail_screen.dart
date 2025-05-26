import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/core/ui/style/app_color.dart';
import 'package:gutty/core/ui/style/app_text_style.dart';
import 'package:gutty/module/detail_screen/widget/ingrediant_list.dart';
import 'package:gutty/module/detail_screen/widget/nutrition_fact.dart';
import 'package:gutty/module/detail_screen/widget/static_content.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});
  static const routeName = '/detail-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            scrolledUnderElevation: 0,
            centerTitle: true,
            floating: true,
            title: Text('Meal Detail', style: AppTextStyle.font18Bold),
            actions: [
              IconButton(
                style: Theme.of(context).iconButtonTheme.style,
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
              ),
            ],
          ),

          // Static content section
          const StaticContent(),

          // Ingredients list
          const IngrediantList(),

          // Optional bottom spacing
          SliverToBoxAdapter(child: SizedBox(height: 40.h)),
        ],
      ),
    );
  }
}
