import 'package:flutter/material.dart';
import 'package:pitstop/components/appbar.dart';
import 'package:pitstop/components/drawer.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final String title;
  final bool showBackButton;

  const MainLayout({
    super.key,
    required this.title,
    required this.child,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        showBackButton: showBackButton,
      ),
      drawer: showBackButton ? null : const CustomDrawer(),
      body: child,
    );
  }
}
