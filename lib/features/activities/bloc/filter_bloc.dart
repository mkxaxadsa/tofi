import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/db/db.dart';
import '../../../core/utils.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterInitial()) {
    on<FilterDataEvent>(_filterDataEvent);
  }
  _filterDataEvent(FilterDataEvent event, emit) {
    var now = DateTime.now();
    switch (event.type) {
      case "Day":
        int income = 0;
        int expense = 0;
        for (var element in DB.moneyList) {
          DateTime date = DateTime.fromMillisecondsSinceEpoch(
            element.id * 1000,
          );
          logger(date);
          if (date.weekday == now.weekday &&
              date.month == now.month &&
              date.year == now.year) {
            if (element.income) {
              income += element.amount;
            } else {
              expense += element.amount;
            }
          }
        }
        emit(
          FilterDataState(
            [
              [income / 1, expense / 1]
            ],
            weekday: now.weekday - 1,
          ),
        );
        break;
      case "Week":
        List<List<double>> bars = [];
        DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
        DateTime endOfWeek = startOfWeek.add(const Duration(days: 6));
        logger(startOfWeek);
        for (int i = 0; i < 7; i++) {
          int income = 0;
          int expense = 0;
          for (var element in DB.moneyList) {
            DateTime date = DateTime.fromMillisecondsSinceEpoch(
              element.id * 1000,
            );
            logger(startOfWeek.subtract(const Duration(days: 1)).day + i);
            logger("Date: ${date.day}");
            if (date.isAfter(startOfWeek.subtract(const Duration(days: 1))) &&
                date.isBefore(endOfWeek.add(const Duration(days: 1)))) {
              if (startOfWeek.day + i == date.day) {
                if (element.income) {
                  income += element.amount;
                } else {
                  expense += element.amount;
                }
              }
            }
          }
          bars.add([income / 1, expense / 1]);
        }
        logger(bars);
        emit(FilterDataState(bars));
        break;

      case "Month":
        List<List<double>> bars = [];
        var month = DateTime(now.year, now.month, 1, 0, 0, 0, 0, 0);
        for (int i = 0; i < 4; i++) {
          int income = 0;
          int expense = 0;
          for (var element in DB.moneyList) {
            DateTime date = DateTime.fromMillisecondsSinceEpoch(
              element.id * 1000,
            );
            logger((month.day * ((i) * 6)));
            logger("Date: ${date.day}");
            if ((month.day * i == 0 ? 1 : ((i + 1) * 6)) <= date.day &&
                ((month.day + 6) * (i + 1)) >= date.day &&
                date.month == month.month &&
                date.year == month.year) {
              if (element.income) {
                income += element.amount;
              } else {
                expense += element.amount;
              }
            }
          }
          bars.add([income / 1, expense / 1]);
        }
        emit(FilterDataState(bars));
        break;
    }
  }
}
