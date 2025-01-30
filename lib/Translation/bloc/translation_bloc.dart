import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ml_kit/Translation/Utils/enum.dart';
import 'package:flutter_ml_kit/Translation/Utils/language_identification_util.dart';

part 'translation_event.dart';
part 'translation_state.dart';

class TranslationBloc extends Bloc<TranslationEvent, TranslationState> {
  TranslationBloc() : super(TranslationState()) {
    on<GetLanguageEvent>(onGetLanguageEvent);
  }

  void onGetLanguageEvent(
      GetLanguageEvent event, Emitter<TranslationState> emit) async {
    emit(state.copyWith(
      status: Status.loading,
    ));

    final String message =
        await LanguageIdentificationUtil().identifyLanguage(event.languageCode);
    emit(
      state.copyWith(
        status: Status.success,
        language: message,
      ),
    );
  }
}
