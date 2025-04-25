import 'package:book_app/feature/Search/presentation/views/widget/search_item_list_view_section.dart';
import 'package:book_app/feature/Search/presentation/views/widget/search_result_section.dart';
import 'package:book_app/feature/Search/presentation/views/widget/search_text_field_section.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: NeverScrollableScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: SearchTextFieldSection()),
        SliverToBoxAdapter(child: SearchResultSection()),
        SliverFillRemaining(child: SearchItemListViewSection()),
      ],
    );
  }
}
