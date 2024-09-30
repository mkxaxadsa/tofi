import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_r.dart';

class ExchangeCard extends StatelessWidget {
  const ExchangeCard({
    super.key,
    required this.dollar,
  });

  final bool dollar;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.card1,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const SizedBox(width: 18),
          SvgPicture.asset(dollar ? 'assets/dollar.svg' : 'assets/euro.svg'),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextL(dollar ? 'USD' : 'EUR', fontSize: 10),
              TextM(dollar ? 'Dollar' : 'Euro', fontSize: 14),
            ],
          ),
          const Spacer(flex: 2),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextL(dollar ? 'USD' : 'EUR', fontSize: 10),
              TextM(dollar ? '\$1.00' : '\$0.92', fontSize: 14),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
