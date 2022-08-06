import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio/core/models/Profile.dart';
import 'package:portfolio/core/services/airtable_service.dart';

import '../../core/models/experience.dart';
import '../../core/models/project.dart';

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
      final  expList = await _airtableService.getListExperience();
      final projects = await _airtableService.getProjectsList();
      emit(PageDataLoad(profileInfo: profileInfo, expList: expList, projects: projects));
    });
  }
}
