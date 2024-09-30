import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/money.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/dialogs/delete_dialog.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../bloc/money_bloc.dart';
import '../widgets/category_card.dart';

class MoneyEditPage extends StatefulWidget {
  const MoneyEditPage({super.key, required this.money});

  final Money money;

  @override
  State<MoneyEditPage> createState() => _MoneyEditPageState();
}

class _MoneyEditPageState extends State<MoneyEditPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  bool active = true;

  bool getCategoryActive(String value) {
    if (controller3.text == value) return true;
    return false;
  }

  void checkActive() {
    setState(() {
      active = getButtonActive([
        controller1,
        controller2,
        controller3,
      ]);
    });
  }

  void onCategory(String value) {
    controller3.text = value;
    checkActive();
  }

  void onEdit() {
    context.read<MoneyBloc>().add(
          EditMoneyEvent(
            money: Money(
              id: widget.money.id,
              title: controller1.text,
              amount: int.tryParse(controller2.text) ?? 0,
              category: controller3.text,
              income: widget.money.income,
            ),
          ),
        );
    context.pop();
  }

  void onDelete() {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteDialog(
          title: widget.money.income
              ? 'Delete this Income?'
              : 'Delete this Expense?',
          onYes: () {
            context
                .read<MoneyBloc>()
                .add(DeleteMoneyEvent(id: widget.money.id));
            context.pop();
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    controller1.text = widget.money.title;
    controller2.text = widget.money.amount.toString();
    controller3.text = widget.money.category;
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        const SizedBox(height: 22),
        TextB(
          widget.money.income ? 'Edit Income' : 'Edit Expense',
          fontSize: 32,
        ),
        const SizedBox(height: 24),
        TextR(
          'Title',
          fontSize: 16,
          color: AppColors.white40,
        ),
        const SizedBox(height: 8),
        TxtField(
          controller: controller1,
          hintText: 'Name title',
          onChanged: checkActive,
        ),
        const SizedBox(height: 16),
        TextR(
          'Amount (\$)',
          fontSize: 16,
          color: AppColors.white40,
        ),
        const SizedBox(height: 8),
        TxtField(
          controller: controller2,
          hintText: 'Amount Expense',
          number: true,
          length: 6,
          onChanged: checkActive,
        ),
        const SizedBox(height: 16),
        TextR(
          'Amount (\$)',
          fontSize: 16,
          color: AppColors.white40,
        ),
        const SizedBox(height: 8),
        if (widget.money.income) ...[
          CategoryCard(
            category: 'Business',
            active: getCategoryActive('Business'),
            onPressed: onCategory,
          ),
          const SizedBox(height: 8),
          CategoryCard(
            category: 'Salary',
            active: getCategoryActive('Salary'),
            onPressed: onCategory,
          ),
          const SizedBox(height: 8),
          CategoryCard(
            category: 'Dividends',
            active: getCategoryActive('Dividends'),
            onPressed: onCategory,
          ),
          const SizedBox(height: 8),
          CategoryCard(
            category: 'Rent',
            active: getCategoryActive('Rent'),
            onPressed: onCategory,
          ),
          const SizedBox(height: 8),
          CategoryCard(
            category: 'Freelance',
            active: getCategoryActive('Freelance'),
            onPressed: onCategory,
          ),
        ] else ...[
          CategoryCard(
            category: 'Procurement',
            active: getCategoryActive('Procurement'),
            onPressed: onCategory,
          ),
          const SizedBox(height: 8),
          CategoryCard(
            category: 'Food',
            active: getCategoryActive('Food'),
            onPressed: onCategory,
          ),
          const SizedBox(height: 8),
          CategoryCard(
            category: 'Transport',
            active: getCategoryActive('Transport'),
            onPressed: onCategory,
          ),
          const SizedBox(height: 8),
          CategoryCard(
            category: 'Rest',
            active: getCategoryActive('Rest'),
            onPressed: onCategory,
          ),
          const SizedBox(height: 8),
          CategoryCard(
            category: 'Investment',
            active: getCategoryActive('Investment'),
            onPressed: onCategory,
          ),
        ],
        const SizedBox(height: 16),
        PrimaryButton(
          title: 'Edit',
          active: active,
          onPressed: onEdit,
        ),
        const SizedBox(height: 16),
        PrimaryButton(
          title: 'Delete',
          onPressed: onDelete,
        ),
      ],
    );
  }
}
