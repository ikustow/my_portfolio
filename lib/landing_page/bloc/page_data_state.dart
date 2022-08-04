part of 'page_data_bloc.dart';

abstract class PageDataState extends Equatable {
  const PageDataState();
}

class PageDataInitial extends PageDataState {
  @override
  List<Object> get props => [];
}

class PageDataLoad extends PageDataState {
  final Profile profileInfo;

  PageDataLoad({required this.profileInfo});

  @override
  List<Object> get props => [];
}
