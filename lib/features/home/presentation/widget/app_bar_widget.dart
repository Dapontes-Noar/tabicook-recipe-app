import 'package:flutter/material.dart';
import 'package:tabi_cook/core/utils/extensions/context_extensions.dart';
import 'package:tabi_cook/styles/app_styles.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) => PreferredSize(
    preferredSize: const Size.fromHeight(80),
    child: Padding(
      padding: EdgeInsets.only(
        top: $appStyles.padding.m,
        left: $appStyles.padding.s,
      ),
      child: AppBar(
        title: Text(context.l10n.homeTitle, style: $appStyles.text.heading1),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
    ),
  );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
