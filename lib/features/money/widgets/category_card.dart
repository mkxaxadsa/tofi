import 'package:finance27/core/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_r.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
    required this.active,
    required this.onPressed,
  });

  final String category;
  final bool active;
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: active ? AppColors.white40 : AppColors.white8,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CupertinoButton(
        onPressed: () {
          onPressed(category);
        },
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            SizedBox(
              width: 48,
              child: Center(
                child: SvgPicture.asset(getCategorySvg(category)),
              ),
            ),
            Expanded(
              child: TextR(
                category,
                fontSize: 16,
                color: active ? AppColors.white : AppColors.white40,
              ),
            ),
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: AppColors.white8,
                borderRadius: BorderRadius.circular(10),
              ),
              child: active ? SvgPicture.asset('assets/active.svg') : null,
            ),
            const SizedBox(width: 18),
          ],
        ),
      ),
    );
  }
}
