import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proxvision/features/landing/widget/custom_navigation_bar.dart';

class LandingScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const LandingScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
      ),
      body: navigationShell,
    );
  }
}
