import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ml_kit/picture/utils/enums.dart';
import 'package:flutter_ml_kit/picture/utils/image_picker_util.dart';
import 'package:flutter_ml_kit/picture/utils/image_text_picker_util.dart';
import 'package:image_picker/image_picker.dart';

part 'picture_to_text_event.dart';
part 'picture_to_text_state.dart';

class PictureToTextBloc extends Bloc<PictureToTextEvent, PictureToTextState> {
  PictureToTextBloc() : super(PictureToTextState()) {
    on<PictureFromGalleryEvent>(_pictureFromGalery);
    on<ExtractTextEvent>(_extractText);
  }

  void _pictureFromGalery(
      PictureFromGalleryEvent event, Emitter<PictureToTextState> emit) async {
    final file = await ImagePickerUtil().pickImagefromGalley();
    if (file == null) {
      log('Image selection cancelled.');
      return;
    }
    emit(
      state.copyWith(
        file: file,
        status: Status.pictureadded,
      ),
    );
  }

  void _extractText(
      ExtractTextEvent event, Emitter<PictureToTextState> emit) async {
    if (state.file == null) {
      log('No image selected.', name: 'Text extraction');
      emit(state.copyWith(
        status: Status.error,
      ));
    }
    final text = await ImageTextPickerUtil.getTextFromPath(state.file!.path);
    log('Extracted text: $text', name: 'Text from pictures');
    emit(
      state.copyWith(
        extractedText: text,
        status: Status.textextracted,
      ),
    );
  }
}
