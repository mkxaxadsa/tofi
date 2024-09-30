import 'package:hive_flutter/hive_flutter.dart';

import '../models/money.dart';
import '../utils.dart';

class DB {
  static String boxName = 'finance27box';
  static String keyName = 'moneyList';
  static List<Money> moneyList = [];
}

Future<void> initHive() async {
  try {
    await Hive.initFlutter();
    // await Hive.deleteBoxFromDisk(DB.boxName);
    Hive.registerAdapter(MoneyAdapter());
  } catch (e) {
    logger(e);
  }
}

Future<void> getMoneys() async {
  try {
    final box = await Hive.openBox(DB.boxName);
    List data = box.get(DB.keyName) ?? [];
    DB.moneyList = data.cast<Money>();
    logger(DB.moneyList.length);
  } catch (e) {
    logger(e);
  }
}

Future<void> updateMoneys() async {
  try {
    final box = await Hive.openBox(DB.boxName);
    box.put(DB.keyName, DB.moneyList);
    DB.moneyList = await box.get(DB.keyName);
  } catch (e) {
    logger(e);
  }
}
