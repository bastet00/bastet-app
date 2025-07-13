part of 'dictionary_cubit.dart';

sealed class DictionaryState extends Equatable {
  const DictionaryState();
}

final class DictionaryInitial extends DictionaryState {
  @override
  List<Object> get props => [];
}

final class DictionaryLoading extends DictionaryState {
  @override
  List<Object> get props => [];
}
