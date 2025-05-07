import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pharmascan/utils/app_colors.dart';
import '../widgets/authentication_screen_body.dart';

class StartScreen extends StatefulWidget
{
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
{
  @override
  void didChangeDependencies()
  {
    precacheImage(const AssetImage('assets/save.png'), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: FadeInDownBig(child: AuthenticationScreenBody()),
    );
  }
}