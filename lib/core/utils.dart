import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'db/db.dart';
import 'models/money.dart';

double navBarHeight = 62;

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

double getStatusBar(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}

double getBottom(BuildContext context) {
  return MediaQuery.of(context).viewPadding.bottom;
}

bool getButtonActive(List<TextEditingController> controllers) {
  for (TextEditingController controller in controllers) {
    if (controller.text.isEmpty) return false;
  }
  return true;
}

void logger(Object message) {
  try {
    developer.log(message.toString());
  } catch (e) {
    debugPrint(e.toString());
  }
}

void precacheImages(BuildContext context) {
  try {
    List<String> imageAssets = [
      'assets/onboard1.png',
      'assets/onboard2.png',
    ];
    for (String assets in imageAssets) {
      precacheImage(AssetImage(assets), context);
    }
  } catch (e) {
    logger(e);
  }
}

String getCategorySvg(String cat) {
  if (cat == 'Business') return 'assets/category/cat1.svg';
  if (cat == 'Salary') return 'assets/category/cat2.svg';
  if (cat == 'Dividends') return 'assets/category/cat3.svg';
  if (cat == 'Rent') return 'assets/category/cat5.svg';
  if (cat == 'Freelance') return 'assets/category/cat6.svg';
  if (cat == 'Procurement') return 'assets/category/cat7.svg';
  if (cat == 'Food') return 'assets/category/cat8.svg';
  if (cat == 'Transport') return 'assets/category/cat9.svg';
  if (cat == 'Rest') return 'assets/category/cat10.svg';
  if (cat == 'Investment') return 'assets/category/cat11.svg';
  return 'assets/category/cat1.svg';
}

int totalIncome = 0;
int totalExpense = 0;

void getTotalMoney() {
  totalIncome = 0;
  totalExpense = 0;
  for (Money money in DB.moneyList) {
    if (money.income) {
      totalIncome += money.amount;
    } else {
      totalExpense += money.amount;
    }
  }
}

String formatNumber(int number) {
  return NumberFormat('#,###').format(number);
}
