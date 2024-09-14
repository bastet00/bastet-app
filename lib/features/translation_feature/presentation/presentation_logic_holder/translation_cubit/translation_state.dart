part of 'translation_cubit.dart';

sealed class TranslationState extends Equatable {
  const TranslationState();
}

final class TranslationInitial extends TranslationState {
  @override
  List<Object> get props => [];
}
