part of 'translation_bloc.dart';

class TranslationState extends Equatable {
  const TranslationState({
    this.language = '',
    this.status = Status.initial,
    this.translation = '',
  });
  final String language;
  final Status status;
  final String translation;

  TranslationState copyWith({
    String? language,
    Status? status,
    String? translation,
  }) {
    return TranslationState(
      language: language ?? this.language,
      status: status ?? this.status,
      translation: translation ?? this.translation,
    );
  }

  @override
  List<Object> get props => [language, status, translation];
}
