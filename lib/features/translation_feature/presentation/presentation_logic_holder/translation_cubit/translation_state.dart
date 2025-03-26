part of 'translation_cubit.dart';

sealed class TranslationState extends Equatable {
  const TranslationState();
}

final class TranslationInitial extends TranslationState {
  @override
  List<Object> get props => [];
}

final class LiteralTranslationInitial extends TranslationState {
  @override
  List<Object> get props => [];
}

class ConvertLanguageState extends TranslationState {
  final bool fromArabic;
  const ConvertLanguageState(this.fromArabic);
  @override
  List<Object?> get props => [fromArabic];
}

final class TranslationLoading extends TranslationState {
  final bool? literalTranslationLoaded;

  const TranslationLoading({this.literalTranslationLoaded});
  @override
  List<Object?> get props => [literalTranslationLoaded];
}

final class LiteralTranslationLoading extends TranslationState {
  @override
  List<Object> get props => [];
}

final class TranslationDetailsLoading extends TranslationState {
  @override
  List<Object> get props => [];
}

final class SuggestWordLoading extends TranslationState {
  @override
  List<Object> get props => [];
}
