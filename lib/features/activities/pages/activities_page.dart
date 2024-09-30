import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../../money/widgets/income_expense_card.dart';
import '../bloc/filter_bloc.dart';
import '../widgets/bar_chart_widget.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  int tabIndex = 1;

  void changeTab(String title) {
    setState(() {
      if (title == 'Day') {
        tabIndex = 1;
        context.read<FilterBloc>().add(FilterDataEvent('Day'));
      } else if (title == 'Week') {
        tabIndex = 2;
        context.read<FilterBloc>().add(FilterDataEvent('Week'));
      } else {
        tabIndex = 3;
        context.read<FilterBloc>().add(FilterDataEvent('Month'));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    var read = context.read<FilterBloc>();
    read.add(FilterDataEvent('Day'));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 46 + getStatusBar(context)),
        const Center(
          child: TextB('Activities', fontSize: 32),
        ),
        const SizedBox(height: 46),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Tab(
              title: 'Day',
              active: tabIndex == 1,
              onTap: changeTab,
            ),
            const SizedBox(width: 8),
            _Tab(
              title: 'Week',
              active: tabIndex == 2,
              onTap: changeTab,
            ),
            const SizedBox(width: 8),
            _Tab(
              title: 'Month',
              active: tabIndex == 3,
              onTap: changeTab,
            ),
          ],
        ),
        const SizedBox(height: 46),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              const SizedBox(height: 15),
              const _BarChart(),
              const SizedBox(height: 21),
              const IncomeExpenseCard(),
              const SizedBox(height: 21),
              Center(
                child: Container(
                  height: 34,
                  width: 127,
                  decoration: BoxDecoration(
                    color: AppColors.card1,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const TextL('Total', fontSize: 10),
                      TextM(
                        '\$ ${formatNumber(totalIncome - totalExpense)}',
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: navBarHeight),
      ],
    );
  }
}

class _Tab extends StatelessWidget {
  const _Tab({
    required this.title,
    required this.active,
    required this.onTap,
  });

  final String title;
  final bool active;
  final void Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        onTap(title);
      },
      padding: EdgeInsets.zero,
      minSize: 40,
      child: Container(
        height: 40,
        width: active ? 80 : 96,
        decoration: BoxDecoration(
          color: active ? AppColors.main : AppColors.navbar,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: TextM(
            title,
            fontSize: 16,
            color: active ? AppColors.white : AppColors.white50,
          ),
        ),
      ),
    );
  }
}

class _BarChart extends StatelessWidget {
  const _BarChart();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card1,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const Expanded(
            child: BarChartWidget(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 11,
                width: 11,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(width: 7),
              const TextR('Income', fontSize: 12),
              const SizedBox(width: 33),
              Container(
                height: 11,
                width: 11,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.main,
                ),
              ),
              const SizedBox(width: 7),
              const TextR('Expense', fontSize: 12),
            ],
          ),
        ],
      ),
    );
  }
}
