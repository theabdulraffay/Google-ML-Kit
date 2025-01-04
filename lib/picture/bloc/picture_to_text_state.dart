part of 'picture_to_text_bloc.dart';

class PictureToTextState extends Equatable {
  final XFile? file;
  final Status status;
  final String extractedText;
  const PictureToTextState({
    this.file,
    this.status = Status.initial,
    this.extractedText = '',
  });

  PictureToTextState copyWith(
      {XFile? file, Status? status, String? extractedText}) {
    return PictureToTextState(
      file: file ?? this.file,
      status: status ?? this.status,
      extractedText: extractedText ?? this.extractedText,
    );
  }

  @override
  List<Object?> get props => [file, status, extractedText];
}
