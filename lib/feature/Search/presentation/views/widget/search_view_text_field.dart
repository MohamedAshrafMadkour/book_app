import 'package:book_app/feature/Search/presentation/manager/search_book_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SearchViewTextField extends StatefulWidget {
  const SearchViewTextField({super.key});

  @override
  State<SearchViewTextField> createState() => _SearchViewTextFieldState();
}

class _SearchViewTextFieldState extends State<SearchViewTextField> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: IconButton(
            onPressed: () {
              (context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * .85,
          child: TextField(
            controller: controller,
            onSubmitted: (query) {
              context.read<SearchBooksCubit>().getResultSearch(query);
            },

            decoration: InputDecoration(
              border: outlinedInputBorder(),
              hintText: 'Search',
              suffixIcon:
                  controller.text.isEmpty
                      ? IconButton(
                        onPressed: () {
                          controller.clear();
                          context.read<SearchBooksCubit>().emptyRes();
                        },
                        icon: const Icon(Icons.clear),
                      )
                      : const Icon(FontAwesomeIcons.magnifyingGlass, size: 24),
              focusedBorder: outlinedInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder outlinedInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white),
    );
  }
}
