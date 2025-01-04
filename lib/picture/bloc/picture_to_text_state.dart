part of 'picture_to_text_bloc.dart';

class PictureToTextState extends Equatable {
  final XFile? file;
  const PictureToTextState({this.file});

  PictureToTextState copyWith({XFile? file}) {
    // return PictureToTextState(file: file);
    return PictureToTextState(file: file ?? this.file);
  }

  @override
  List<Object> get props => [file ?? ''];
}
