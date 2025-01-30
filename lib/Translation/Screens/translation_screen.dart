import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ml_kit/Translation/Utils/enum.dart';
import 'package:flutter_ml_kit/Translation/Utils/language_identification_util.dart';
import 'package:flutter_ml_kit/Translation/bloc/translation_bloc.dart';
import 'package:google_mlkit_language_id/google_mlkit_language_id.dart';

class TranslationScreen extends StatefulWidget {
  const TranslationScreen({super.key});

  @override
  State<TranslationScreen> createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  Future<String> identify() async {
    return LanguageIdentificationUtil().identifyLanguage('Hola buena gente');
  }

  @override
  void initState() {
    LanguageIdentificationUtil.identifier =
        LanguageIdentifier(confidenceThreshold: .5);
    super.initState();
  }

  @override
  void dispose() {
    LanguageIdentificationUtil.identifier!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          BlocBuilder<TranslationBloc, TranslationState>(
              builder: (context, state) {
            if (state.status == Status.success) {
              return Text(state.language);
            }
            return SizedBox();
          }),
          ElevatedButton(
              onPressed: () async {
                context.read<TranslationBloc>().add(
                    GetLanguageEvent(languageCode: 'Hey there how are you'));
              },
              child: Text('Press me'))
        ],
      ),
    );
  }
}
