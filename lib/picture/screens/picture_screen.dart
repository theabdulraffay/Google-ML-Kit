// import 'package:bloc/bloc.dart';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ml_kit/picture/bloc/picture_to_text_bloc.dart';
import 'package:flutter_ml_kit/picture/utils/enums.dart';

class PictureScreen extends StatelessWidget {
  const PictureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<PictureToTextBloc, PictureToTextState>(
                builder: (context, state) {
                  if (state.file != null) {
                    log('picture: ${state.file!.path}', name: 'PictureScreen');
                    return SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.file(
                        File(
                          state.file!.path,
                        ),
                      ),
                    );
                  }
                  return Center(child: Text('No Image Selected'));
                },
              ),
              BlocBuilder<PictureToTextBloc, PictureToTextState>(
                // Removed buildWhen or use a proper condition
                builder: (context, state) {
                  if (state.status == Status.textextracted) {
                    return Text(state.extractedText);
                  }
                  return Container();
                },
              ),
              ElevatedButton(
                onPressed: () {
                  context
                      .read<PictureToTextBloc>()
                      .add(PictureFromGalleryEvent());
                },
                child: Text('Pick Image from Gallery'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<PictureToTextBloc>().add(ExtractTextEvent());
                },
                child: Text('Extract textfrom Gallery'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
