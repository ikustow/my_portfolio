import 'package:dio/dio.dart';
import 'package:portfolio/core/models/Profile.dart';
import 'package:portfolio/core/models/ProfileData.dart';

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
}