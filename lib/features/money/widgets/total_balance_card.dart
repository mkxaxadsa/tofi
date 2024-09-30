import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../bloc/money_bloc.dart';

class TotalBalanceCard extends StatelessWidget {
  const TotalBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      margin: const EdgeInsets.symmetric(horizontal: 22),
      decoration: BoxDecoration(
        color: AppColors.card1,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SvgPicture.asset(
              'assets/wave.svg',
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    const TextR('Total Balance', fontSize: 16),
                    const Spacer(),
                    BlocBuilder<MoneyBloc, MoneyState>(
                      builder: (context, state) {
                        return TextM(
                          '\$${formatNumber(totalIncome - totalExpense)}',
                          fontSize: 32,
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              SvgPicture.asset('assets/wallet.svg'),
              const SizedBox(width: 30),
            ],
          ),
        ],
      ),
    );
  }
}
