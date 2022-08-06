import 'package:dio/dio.dart';
import 'package:portfolio/core/models/contacts.dart';
import 'package:portfolio/core/models/profile.dart';
import 'package:portfolio/core/models/profile_data.dart';
import 'package:portfolio/core/models/experience.dart';
import 'package:portfolio/core/models/project.dart';

import '../const.dart';
import '../models/cv.dart';

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

  Future<List<Contacts>> getContactsList() async {

    final List<Contacts> listOfContacts = [];
    final response = await Dio().get(
      '$dioAirtableUrl/$projectBase/$recordNameContacts',
      queryParameters: {},
      options: Options(
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Accept': 'Application/json',
        },
      ),
    );

    for (dynamic element in response.data['records']) {
      var contactlement = Contacts.fromJson(element['fields']);
      listOfContacts.add(contactlement);
    }

    return listOfContacts;
  }

  Future<List<CV>> getCVList() async {

    final List<CV> listOfCV = [];
    final response = await Dio().get(
      '$dioAirtableUrl/$projectBase/$recordNameCV',
      queryParameters: {},
      options: Options(
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Accept': 'Application/json',
        },
      ),
    );

    for (dynamic element in response.data['records']) {
      var cvItem = CV.fromJson(element['fields']);
      listOfCV.add(cvItem);
    }

    return listOfCV;
  }

}