part of 'page_data_bloc.dart';

abstract class PageDataEvent extends Equatable {
  const PageDataEvent();
}


class InitialLoadEvent extends PageDataEvent {

  @override
  // TODO: implement props
  List<Object?> get props => [];
}