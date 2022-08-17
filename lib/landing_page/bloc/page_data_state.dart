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
  final List<Experience> expList;
  final List<Project> projects;
  final List<CV> cvList;
  final List<Contacts> contacts;

  const PageDataLoad( {required this.cvList, required this.contacts,required this.projects, required this.expList, required this.profileInfo});

  @override
  List<Object> get props => [];
}
