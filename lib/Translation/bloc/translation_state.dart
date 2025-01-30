part of 'translation_bloc.dart';

sealed class TranslationState extends Equatable {
  const TranslationState();
  
  @override
  List<Object> get props => [];
}

final class TranslationInitial extends TranslationState {}
