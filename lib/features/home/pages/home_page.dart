import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/custom_scaffold.dart';
import '../../activities/pages/activities_page.dart';
import '../../money/pages/money_page.dart';
import 'quiz_page.dart';
import '../bloc/home_bloc.dart';
import '../widgets/nav_bar.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeSettings) return const SettingsPage();

              if (state is HomeActivities) return const ActivitiesPage();

              if (state is HomeQuiz) return const QuizPage();

              return const MoneyPage();
            },
          ),
          const NavBar(),
        ],
      ),
    );
  }
}
