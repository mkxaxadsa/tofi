import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/app_colors.dart';
import '../../core/db/prefs.dart';
import '../../core/widgets/buttons/primary_button.dart';
import '../../core/widgets/custom_scaffold.dart';
import '../../core/widgets/texts/text_r.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int id = 1;
  String title =
      'In one convenient application you can already find everything you need.';
  String desc =
      'Plan your budget, control your income and expenses, track changes in exchange rates and cryptocurrencies and receive notifications about exchange rates and their changes.';

  void onNext() async {
    if (id == 2) {
      await saveOnboard().then((value) {
        if (mounted) context.go('/home');
      });
    } else {
      setState(() {
        id++;
        title = 'Your personal financial advisor';
        desc =
            'This mobile application will allow you to quickly and effectively manage your personal finances.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      splash: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Spacer(flex: 3),
            TextM(
              title,
              fontSize: 32,
              maxLines: 5,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Image.asset('assets/onboard$id.png'),
            const Spacer(),
            PrimaryButton(
              title: 'NEXT',
              onPressed: onNext,
            ),
            SizedBox(
              height: 200,
              child: Center(
                child: TextL(
                  desc,
                  fontSize: 16,
                  color: AppColors.white50,
                  maxLines: 5,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
