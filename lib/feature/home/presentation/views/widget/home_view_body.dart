import 'package:book_app/feature/home/presentation/views/widget/first_home_view_body_section.dart';
import 'package:book_app/feature/home/presentation/views/widget/second_home_view_body_section.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: FirstHomeViewBodySection()),
        SliverFillRemaining(child: SecondHomeViewBodySection()),
      ],
    );
  }
}
