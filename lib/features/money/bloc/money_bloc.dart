import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/db/db.dart';
import '../../../core/models/money.dart';
import '../../../core/utils.dart';

part 'money_event.dart';
part 'money_state.dart';

class MoneyBloc extends Bloc<MoneyEvent, MoneyState> {
  MoneyBloc() : super(MoneyInitial()) {
    on<GetMoneyEvent>((event, emit) async {
      await getMoneys();
      getTotalMoney();
      emit(MoneyLoadedState(moneys: DB.moneyList));
    });

    on<AddMoneyEvent>((event, emit) async {
      DB.moneyList.insert(0, event.money);
      await updateMoneys();
      getTotalMoney();
      emit(MoneyLoadedState(moneys: DB.moneyList));
    });

    on<EditMoneyEvent>((event, emit) async {
      for (Money money in DB.moneyList) {
        if (money.id == event.money.id) {
          money.title = event.money.title;
          money.amount = event.money.amount;
          money.category = event.money.category;
        }
      }
      await updateMoneys();
      getTotalMoney();
      emit(MoneyLoadedState(moneys: DB.moneyList));
    });

    on<DeleteMoneyEvent>((event, emit) async {
      DB.moneyList.removeWhere((element) => element.id == event.id);
      await updateMoneys();
      getTotalMoney();
      emit(MoneyLoadedState(moneys: DB.moneyList));
    });
  }
}
