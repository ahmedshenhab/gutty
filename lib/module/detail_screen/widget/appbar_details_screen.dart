import 'package:flutter/material.dart';
import 'package:gutty/core/ui/style/app_text_style.dart';

class AppbarDetailsScreen extends StatelessWidget {
  const AppbarDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      
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
    );
  }
}
