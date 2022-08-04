import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio/core/models/Profile.dart';
import 'package:portfolio/core/services/airtableService.dart';

part 'page_data_event.dart';
part 'page_data_state.dart';

class PageDataBloc extends Bloc<PageDataEvent, PageDataState> {

  final AirtableService _airtableService;
  PageDataBloc(this._airtableService)
      : super(
    PageDataInitial(),
  ) {

    on<PageDataEvent>((event, emit) async {

    });

    on<InitialLoadEvent>((event, emit) async {
      final  profileInfo = await _airtableService.getProfileInfo();
      emit(PageDataLoad(profileInfo: profileInfo));
    });
  }
}
