import 'package:book_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SellerItemSection extends StatelessWidget {
  const SellerItemSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Special Books',
            style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
