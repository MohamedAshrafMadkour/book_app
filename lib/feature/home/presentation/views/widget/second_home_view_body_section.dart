import 'package:book_app/feature/home/presentation/views/widget/item_scroll_list_vertical.dart';
import 'package:flutter/material.dart';

class SecondHomeViewBodySection extends StatelessWidget {
  const SecondHomeViewBodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 20, right: 16),
      child: ItemScrollListViewVertical(),
    );
  }
}
