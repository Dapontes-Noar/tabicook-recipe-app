import 'package:flutter/material.dart';
import 'package:tabi_cook/core/utils/extensions/context_extensions.dart';
import 'package:tabi_cook/styles/app_styles.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: $appStyles.padding.m,
        right: $appStyles.padding.m,
        top: $appStyles.padding.m,
      ),
      child: SearchBar(
        leading: const Icon(Icons.search),
        hintText: context.l10n.searchRecipes,
        elevation: MaterialStateProperty.all(1),
        backgroundColor: MaterialStateProperty.all(Colors.white),
      ),
    );
  }
}
