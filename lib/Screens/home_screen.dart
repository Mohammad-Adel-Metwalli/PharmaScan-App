import 'package:flutter/material.dart';
import 'package:pharmascan/widgets/custom_app_bar.dart';
import 'package:pharmascan/widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Builder(
          builder:
              (context) => Column(
                children: [
                  CustomAppBar(
                    onPressed: () {
                      Scaffold.of(
                        context,
                      ).openDrawer(); // دي مش هتشتغل مباشرة هنا
                    },
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
