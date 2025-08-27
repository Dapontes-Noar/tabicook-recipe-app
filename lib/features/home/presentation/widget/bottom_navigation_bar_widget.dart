import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tabi_cook/core/utils/constants/app_constants.dart';
import 'package:tabi_cook/routes/routes.dart';
import 'package:tabi_cook/styles/app_styles.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _currentIndex = 0;

  // Define navigation items and their corresponding routes
  final List<Map<String, dynamic>> _navigationItems = [
    {AppConstants.iconKey: Icons.home, AppConstants.routeKey: Routes.home},
    {
      AppConstants.iconKey: Icons.favorite,
      AppConstants.routeKey: Routes.favorites,
    },
    {AppConstants.iconKey: Icons.search, AppConstants.routeKey: Routes.search},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    context.go(_navigationItems[index][AppConstants.routeKey]!.toString());
  }

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: _currentIndex,
    backgroundColor: $appStyles.colors.background,
    selectedItemColor: $appStyles.colors.primaryYellow,
    unselectedItemColor: $appStyles.colors.grey,
    onTap: _onItemTapped,
    items: _navigationItems
        .map(
          (item) => BottomNavigationBarItem(
            icon: Icon(item['icon'] as IconData),
            label: '',
          ),
        )
        .toList(),
  );
}
