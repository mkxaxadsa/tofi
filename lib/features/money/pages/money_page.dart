import 'package:finance27/features/money/widgets/exchange_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/others/no_data.dart';
import '../bloc/money_bloc.dart';
import '../widgets/add_sheet.dart';
import '../widgets/income_expense_card.dart';
import '../widgets/money_button.dart';
import '../widgets/money_card.dart';
import '../widgets/total_balance_card.dart';
import 'money_add_page.dart';

class MoneyPage extends StatefulWidget {
  const MoneyPage({super.key});

  @override
  State<MoneyPage> createState() => _MoneyPageState();
}

class _MoneyPageState extends State<MoneyPage> {
  int pageIndex = 2;

  void onPageChange(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  void onAdd(bool income) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xff101112).withOpacity(0.75),
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        return AddSheet(
          body: MoneyAddPage(income: income),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 13 + getStatusBar(context)),
        const TotalBalanceCard(),
        const SizedBox(height: 17),
        const IncomeExpenseCard(),
        const SizedBox(height: 19),
        Row(
          children: [
            const SizedBox(width: 16),
            MoneyButton(
              title: 'Add Income',
              asset: 'assets/income.svg',
              active: false,
              onPressed: () {
                onAdd(true);
              },
            ),
            const SizedBox(width: 14),
            MoneyButton(
              title: 'Add Expense',
              asset: 'assets/expense.svg',
              active: false,
              onPressed: () {
                onAdd(false);
              },
            ),
            const SizedBox(width: 14),
            MoneyButton(
              title: 'Exchange',
              asset: 'assets/exchange.svg',
              active: pageIndex == 1,
              onPressed: () {
                onPageChange(1);
              },
            ),
            const SizedBox(width: 14),
            MoneyButton(
              title: 'History',
              asset: 'assets/history.svg',
              active: pageIndex == 2,
              onPressed: () {
                onPageChange(2);
              },
            ),
            const SizedBox(width: 16),
          ],
        ),
        const SizedBox(height: 9),
        if (pageIndex == 2) ...[
          BlocBuilder<MoneyBloc, MoneyState>(
            builder: (context, state) {
              if (state is MoneyLoadedState) {
                if (state.moneys.isEmpty) {
                  return const NoData(expanded: true);
                }

                return Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      const SizedBox(height: 9),
                      ...List.generate(
                        state.moneys.length,
                        (index) {
                          return MoneyCard(money: state.moneys[index]);
                        },
                      ),
                    ],
                  ),
                );
              }

              return Container();
            },
          ),
        ] else ...[
          const SizedBox(height: 9),
          const ExchangeCard(dollar: true),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/income1.svg'),
              const SizedBox(width: 5),
              SvgPicture.asset('assets/income2.svg'),
            ],
          ),
          const SizedBox(height: 10),
          const ExchangeCard(dollar: false),
        ],
        SizedBox(height: navBarHeight + getBottom(context)),
      ],
    );
  }
}
