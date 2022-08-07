import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/services/airtable_service.dart';
import 'package:portfolio/landing_page/bloc/page_data_bloc.dart';
import 'package:portfolio/landing_page/responsive/responsive.dart';
import 'package:portfolio/landing_page/pages/home_desktop.dart';
import 'package:portfolio/landing_page/pages/home_mobile.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: RepositoryProvider(
        create: (context) => AirtableService(),
        child: StartPage(),
      ),
    );
  }
}

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageDataBloc(
        RepositoryProvider.of<AirtableService>(context),
      )..add(InitialLoadEvent()),
      child: BlocBuilder<PageDataBloc, PageDataState>(
        builder: (context, state) {
          if (state is PageDataInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PageDataLoad) {
            return ResponsiveLayout(
              mobileAppBody: HomeMobile(
                profileInfo: state.profileInfo,
                expList: state.expList,
                projects: state.projects,
                contacts: state.contacts,
                cvList: state.cvList,
              ),
              desktopBody: HomeDesktop(
                profileInfo: state.profileInfo,
                expList: state.expList,
                projects: state.projects,
                contacts: state.contacts,
                cvList: state.cvList,
              ),
              tabletBody: HomeMobile(
                profileInfo: state.profileInfo,
                expList: state.expList,
                projects: state.projects,
                contacts: state.contacts,
                cvList: state.cvList,
              ),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
