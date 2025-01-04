import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ml_kit/picture/utils/image_picker_util.dart';
import 'package:image_picker/image_picker.dart';

part 'picture_to_text_event.dart';
part 'picture_to_text_state.dart';

class PictureToTextBloc extends Bloc<PictureToTextEvent, PictureToTextState> {
  PictureToTextBloc() : super(PictureToTextState()) {
    on<PictureFromGalleryEvent>(_pictureFromGalery);
  }

  void _pictureFromGalery(
      PictureFromGalleryEvent event, Emitter<PictureToTextState> emit) async {
    final file = await ImagePickerUtil().pickImagefromGalley();
    log('file: ${file!.path}', name: 'PictureToTextBloc');
    emit(
      state.copyWith(
        file: file,
      ),
    );
  }
}
