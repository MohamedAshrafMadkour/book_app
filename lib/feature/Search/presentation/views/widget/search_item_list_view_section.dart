import 'package:book_app/feature/Search/presentation/views/widget/search_item_list_view.dart';
import 'package:flutter/material.dart';

class SearchItemListViewSection extends StatelessWidget {
  const SearchItemListViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SearchItemListView(),
    );
  }
}
