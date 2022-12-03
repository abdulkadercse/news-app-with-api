import 'dart:convert';
import 'package:news_app_with_api/models/SignInModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:news_app_with_api/models/SignUpModel.dart';
import '../const/server_config.dart';
import 'package:http/http.dart' as http;

import '../models/News_details_model.dart';
import '../models/News_model.dart';

class AuthRepo {
  Future<bool> signUpWithEmail(
      String firstName,
      String lastName,
      String emailAddress,
      String phoneNumber,
      String password,
      String passwordConfirmation) async {
    var url = ServerConfig.serverUrl + ServerConfig.signUpUrl;
    var response = await http.post(Uri.parse(url), body: <String, String>{
      "first_name": firstName,
      "last_name": lastName,
      "email": emailAddress,
      "phone": phoneNumber,
      "password": password,
      "password_confirmation": passwordConfirmation
    });
    final prefs = await SharedPreferences.getInstance();
    var data = jsonDecode(response.body);

    if (response.statusCode == 201) {
      var message = SignUpModel.fromJson(data);
      await prefs.setString('token', message.accessToken.toString());
      return true;
    } else {
      throw Exception('User Have Exist');
    }
  }

  Future<bool> signInWithEmail(String email, String password) async {
    var url = ServerConfig.serverUrl + ServerConfig.signInUrl;
    var response = await http.post(Uri.parse(url),
        body: <String, String>{"email": email, "password": password});
    final prefs = await SharedPreferences.getInstance();
    var data = jsonDecode(response.body);

    if (response.statusCode == 201) {
      var message = SignInModel.fromJson(data);
      await prefs.setString('token', message.accessToken.toString());
      return true;
    } else {
      throw Exception('User Have Exist');
    }
  }

  Future<NewsModel> getNews() async{
    var response = await http.get(Uri.parse(ServerConfig.serverUrl + ServerConfig.latestNewsUrl));
    if(response.statusCode == 200){
      return NewsModel.fromJson(jsonDecode(response.body));
    } else{
      throw Exception('Error Occurred');
    }
  }

  Future<NewsDetailsModel> getNewsDetails(String id) async{
    var response = await http.get(Uri.parse('${ServerConfig.serverUrl + ServerConfig.newsDetailsUrl}/$id'));
    if(response.statusCode == 200){
      return NewsDetailsModel.fromJson(jsonDecode(response.body));
    } else{
      throw Exception('Error Occurred');
    }
  }
}
