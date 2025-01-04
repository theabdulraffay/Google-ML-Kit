part of 'picture_to_text_bloc.dart';

sealed class PictureToTextEvent extends Equatable {
  const PictureToTextEvent();

  @override
  List<Object> get props => [];
}

class PictureFromGalleryEvent extends PictureToTextEvent {
  const PictureFromGalleryEvent();
}

class ExtractTextEvent extends PictureToTextEvent {
  const ExtractTextEvent();
}
