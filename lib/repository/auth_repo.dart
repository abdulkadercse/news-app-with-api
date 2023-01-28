import 'dart:convert';
import 'package:news_app_with_api/models/SignInModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:news_app_with_api/models/SignUpModel.dart';
import '../const/server_config.dart';
import 'package:http/http.dart' as http;

import '../models/CategoryDetails/CategoryFirstModel.dart';
import '../models/News Categories/NewsCategoriesModel.dart';
import '../models/News_details_model.dart';
import '../models/News_model.dart';
import '../models/Search Model/SeachModel.dart';

class AuthRepo {
  // sign up
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

// sign in
  Future<bool> signInWithEmail(String email, String password) async {
    var url = ServerConfig.serverUrl + ServerConfig.signInUrl;
    var response = await http.post(Uri.parse(url),
        body: <String, String>{"email": email, "password": password});
    final prefs = await SharedPreferences.getInstance();
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      var message = SignInModel.fromJson(data);
      await prefs.setString('token', message.accessToken.toString());
      return true;
    } else {
      throw Exception('User Have Exist');
    }
  }

// get news
  Future<NewsModel> getNews() async {
    var response = await http
        .get(Uri.parse(ServerConfig.serverUrl + ServerConfig.latestNewsUrl));
    if (response.statusCode == 200) {
      return NewsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error Occurred');
    }
  }

// Get News Details
  Future<NewsDetailsModel> getNewsDetails(String id) async {
    var response = await http.get(Uri.parse(
        '${ServerConfig.serverUrl + ServerConfig.newsDetailsUrl}/$id'));
    if (response.statusCode == 200) {
      return NewsDetailsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error Occurred');
    }
  }

  // Change Password
  Future<bool> changePasswordRepo(String currentPass, String newPass, String cNewPass) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var response = await http.post(
        Uri.parse(ServerConfig.serverUrl + ServerConfig.changePassword),
        body: <String, String>{
          'current_password': currentPass,
          'password': newPass,
          'password_confirmation': cNewPass
        },
        headers: <String, String>{
          'Authorization': "Bearer $token"
        });

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Error Update Profile");
    }
  }

  // Update Profile
  Future<bool> updateProfileRepo(String fName, String lName, String email, String phone) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var response = await http.post(
        Uri.parse(ServerConfig.serverUrl + ServerConfig.updateProfile),
        body: <String, String>{
          'first_name': fName,
          'last_name': lName,
          'email': email,
          'phone': phone
        },
        headers: <String, String>{
          'Authorization': "Bearer $token"
        });
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Error Update Profile");
    }
  }

  // log out
  Future<bool> logOut(String token) async {
    var response = await http.get(
        Uri.parse(ServerConfig.serverUrl + ServerConfig.logOut),
        headers: <String, String>{'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Error');
    }
  }

  // Search
  Future<SeachModel> getSearch(String item) async {
    var response = await http.post(
        Uri.parse(ServerConfig.serverUrl + ServerConfig.search),
        body: <String, String>{'search': item});
    if (response.statusCode == 200) {
      return SeachModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error');
    }
  }
  Future<NewsCategoriesModel> getcategory()async{
    var response= await http.get(Uri.parse(ServerConfig.serverUrl + ServerConfig.categorfirst));
    if(response.statusCode==200){
      return NewsCategoriesModel.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception('Error');
    }

  }

  // News Category
  Future<NewsCategoriesModel> newsCategory() async {
    var response = await http
        .get(Uri.parse(ServerConfig.serverUrl + ServerConfig.newsCategories));
    if (response.statusCode == 200) {
      return NewsCategoriesModel.fromJson(jsonDecode(response.body));
    } else {
      return throw Exception("Error");
    }
  }

  //getFirstCategory
  Future<CategoryFirstModel> getFirstCategory(String id)async{
    var response= await http.get(Uri.parse('${ServerConfig.serverUrl + ServerConfig.categorfirst} / $id'));
    if(response.statusCode==200){
      return CategoryFirstModel.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception('Error');
    }

  }







}
