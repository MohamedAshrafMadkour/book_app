import 'package:book_app/feature/home/presentation/views/widget/custom_book_list_view.dart';
import 'package:book_app/feature/home/presentation/views/widget/home_view_app_bar.dart';
import 'package:book_app/feature/home/presentation/views/widget/seller_item_section.dart';
import 'package:flutter/material.dart';

class FirstHomeViewBodySection extends StatelessWidget {
  const FirstHomeViewBodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeViewAppBar(),
        CustomBookListView(),
        SizedBox(height: 30),
        SellerItemSection(),
      ],
    );
  }
}
