import 'package:book_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SearchResultSection extends StatelessWidget {
  const SearchResultSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            'Search Result',
            style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}
