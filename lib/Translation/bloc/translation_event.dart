part of 'translation_bloc.dart';

sealed class TranslationEvent extends Equatable {
  const TranslationEvent();

  @override
  List<Object> get props => [];
}

class GetLanguageEvent extends TranslationEvent {
  final String languageCode;
  const GetLanguageEvent({required this.languageCode});
  @override
  List<Object> get props => [languageCode];
}
