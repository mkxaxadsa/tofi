part of 'money_bloc.dart';

abstract class MoneyState {}

class MoneyInitial extends MoneyState {}

class MoneyLoadedState extends MoneyState {
  final List<Money> moneys;
  MoneyLoadedState({required this.moneys});
}
