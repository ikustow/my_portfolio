import 'package:dio/dio.dart';
import 'package:portfolio/core/models/Profile.dart';
import 'package:portfolio/core/models/ProfileData.dart';
import 'package:portfolio/core/models/experience.dart';
import 'package:portfolio/core/models/project.dart';

import '../const.dart';

class AirtableService {


  Future<Profile> getProfileInfo() async {
    final response = await Dio().get(
      '$dioAirtableUrl/$projectBase/$recordNamePersonalInfo',
      queryParameters: {},
      options: Options(
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Accept': 'Application/json',
        },
      ),
    );
    final profileData = ProfileData.fromJson(response.data);

    final profileInfo = Profile(
      avatarURL: profileData.records!.first.fields!.avatarFile!.first.url.toString(),
      name: profileData.records!.first.fields!.name.toString(),
      surname: profileData.records!.first.fields!.surname.toString(),
      position: profileData.records!.first.fields!.position.toString(),
      welcomeText: profileData.records!.first.fields!.welcomeText.toString(),);

    return profileInfo;
  }

  Future<List<Experience>> getListExperience() async {

    final List<Experience> listOfExp= [];
    final response = await Dio().get(
      '$dioAirtableUrl/$projectBase/$recordNameExp',
      queryParameters: {},
      options: Options(
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Accept': 'Application/json',
        },
      ),
    );

    for (dynamic element in response.data['records']) {
      var expElement = Experience.fromJson(element['fields']);
      listOfExp.add(expElement);
    }

    return listOfExp;
  }

  Future<List<Project>> getProjectsList() async {

    final List<Project> listOfProjects= [];
    final response = await Dio().get(
      '$dioAirtableUrl/$projectBase/$recordNameProjects',
      queryParameters: {},
      options: Options(
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Accept': 'Application/json',
        },
      ),
    );

    for (dynamic element in response.data['records']) {
      var projectElement = Project.fromJson(element['fields']);
      listOfProjects.add(projectElement);
    }

    return listOfProjects;
  }

}