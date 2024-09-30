import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_r.dart';

class MoneyButton extends StatelessWidget {
  const MoneyButton({
    super.key,
    required this.title,
    required this.asset,
    required this.active,
    required this.onPressed,
  });

  final String title;
  final String asset;
  final bool active;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: Container(
          height: 64,
          width: double.infinity,
          decoration: BoxDecoration(
            color: active ? AppColors.card1 : AppColors.card2,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Column(
            children: [
              const Spacer(),
              SvgPicture.asset(asset),
              const SizedBox(height: 4),
              TextM(title, fontSize: 11),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
