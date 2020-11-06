import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:esewa_hci/common/constants.dart';

import 'package:esewa_hci/models/language_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'language_event.dart';
part 'language_state.dart';

@lazySingleton
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc()
      : super(
          LanguageLoaded(
            Locale(Constants.languages.first.code),
          ),
        );

  @override
  Stream<LanguageState> mapEventToState(
    LanguageEvent event,
  ) async* {
    if (event is ToggleLanguageEvent) {
      yield LanguageLoaded(Locale(event.language.code));
    }
  }
}
