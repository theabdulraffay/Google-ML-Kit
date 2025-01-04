// import 'package:bloc/bloc.dart';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ml_kit/picture/bloc/picture_to_text_bloc.dart';

class PictureScreen extends StatelessWidget {
  const PictureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<PictureToTextBloc, PictureToTextState>(
              builder: (context, state) {
                log('picture: ${state.file?.path}', name: 'PictureScreen');
                return SizedBox(
                  height: 200,
                  width: 200,
                  child: state.file == null
                      ? Center(child: Text('No Image Selected'))
                      : Image.file(
                          File(
                            state.file!.path,
                          ),
                        ),
                );
              },
            ),
            BlocBuilder<PictureToTextBloc, PictureToTextState>(
                // Removed buildWhen or use a proper condition
                buildWhen: (curr, prev) => false,
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      context
                          .read<PictureToTextBloc>()
                          .add(PictureFromGalleryEvent());
                    },
                    child: Text('Pick Image from Gallery'),
                  );
                })
          ],
        ),
      ),
    );
  }
}
