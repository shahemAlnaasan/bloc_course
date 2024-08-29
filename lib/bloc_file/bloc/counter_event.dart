part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEventv extends CounterEvent {}

class ResetEvent extends CounterEvent {}
