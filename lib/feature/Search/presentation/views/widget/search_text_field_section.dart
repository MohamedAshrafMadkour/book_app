import 'package:book_app/feature/Search/presentation/views/widget/search_view_text_field.dart';
import 'package:flutter/material.dart';

class SearchTextFieldSection extends StatelessWidget {
  const SearchTextFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [SearchViewTextField(), SizedBox(height: 24)],
    );
  }
}
