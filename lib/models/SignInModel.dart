
/// status : "Success"
/// message : "Login Successful"
/// user : {"id":38,"first_name":"test","last_name":"test","phone":"345345390","email":"test@gmail.com","verification_code":null,"verification_expire_at":null,"created_at":"2022-11-21T12:18:17.000000Z","updated_at":"2022-11-21T12:18:17.000000Z"}
/// access_token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMDk5NTY2ZTk1ZDkwNWE2YzFjZjYyYWU5YWYwMDdhZWY1NzA0YWY0ZWRjM2I3MmI4NTNjZGZlMjU4YWI1OTNkMDhhZTFlZTI5MDcwOTc4MDciLCJpYXQiOjE2NjkyMTE5OTAuOTM5MTU4OTE2NDczMzg4NjcxODc1LCJuYmYiOjE2NjkyMTE5OTAuOTM5MTYyOTY5NTg5MjMzMzk4NDM3NSwiZXhwIjoxNzAwNzQ3OTkwLjkzMzYzNTk1MDA4ODUwMDk3NjU2MjUsInN1YiI6IjM4Iiwic2NvcGVzIjpbXX0.pCvn2a-HShU4D7BDWQM7l9Ri7SJjXUeS512OS5rmWVdDxHb00GLHmcmWEnGre6uFNOzcvQ_wUONHGL3InlDrn0eU-pi-hiaHgNrr88w3Yqdhfrr029Q2NEhoQTTJlfgXzTGgBvOJ2u1jbb4YoFI8Viey3uEn1I9OaeDeH_o2sdJ-bQby-UaAkKTS8s-d0I1fTOxo_p8MQ_CC25u02BJ1BTQsoZfkikTvb6SSVqKr6Lh4mKy6nsGz-YS2YfBFxfNh7Dhr3wYjp3Mzh8S3iwLxDNHVP_xeMZ8uf29JnUb3eK0ryhQzjno7RI-wU-ICMKrraZqw9lAq-D2Ewj6O0Du9q2JENmEBqVBSsExuOELcrRNlh5LMnNFSMq1DTJyS3AiORxTqZrvujvg80A097u70Zk4TWA4MoW2fAo5KV1MzSizHYMoHMFloT6EiwHjZZcYqhZJy08eFn1fknXG5DC2i47Ks9hloV4F_bpt-0iSMw-PK6w6Gp9UU8kL5RP3XpUJ6z49o8VFBYbM_gKeTkxbF9NNMi9lCpLgo7q0b4ie8cyhDDAAq2I2HY6HMwTCHx0EV312HpZU4zCQC0wIjtXBwP5lpsvX3f16AimS_WOKNNpufWY5fxvCcgsCb-WGw7GUVqYWO_eiT0t0J7-ojeRyQzT5anwfx9tX5rBtUd0ha9ww"
/// token_type : "Bearer"
/// expires_at : "2023-11-23 13:59:50"

class SignInModel {
  SignInModel({
      String? status, 
      String? message, 
      User? user, 
      String? accessToken, 
      String? tokenType, 
      String? expiresAt,}){
    _status = status;
    _message = message;
    _user = user;
    _accessToken = accessToken;
    _tokenType = tokenType;
    _expiresAt = expiresAt;
}

  SignInModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _accessToken = json['access_token'];
    _tokenType = json['token_type'];
    _expiresAt = json['expires_at'];
  }
  String? _status;
  String? _message;
  User? _user;
  String? _accessToken;
  String? _tokenType;
  String? _expiresAt;

  String? get status => _status;
  String? get message => _message;
  User? get user => _user;
  String? get accessToken => _accessToken;
  String? get tokenType => _tokenType;
  String? get expiresAt => _expiresAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['access_token'] = _accessToken;
    map['token_type'] = _tokenType;
    map['expires_at'] = _expiresAt;
    return map;
  }

}
/// id : 38
/// first_name : "test"
/// last_name : "test"
/// phone : "345345390"
/// email : "test@gmail.com"
/// verification_code : null
/// verification_expire_at : null
/// created_at : "2022-11-21T12:18:17.000000Z"
/// updated_at : "2022-11-21T12:18:17.000000Z"

class User {
  User({
    int? id,
    String? firstName,
    String? lastName,
    String? phone,
    String? email,
    dynamic verificationCode,
    dynamic verificationExpireAt,
    String? createdAt,
    String? updatedAt,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _phone = phone;
    _email = email;
    _verificationCode = verificationCode;
    _verificationExpireAt = verificationExpireAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _phone = json['phone'];
    _email = json['email'];
    _verificationCode = json['verification_code'];
    _verificationExpireAt = json['verification_expire_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _firstName;
  String? _lastName;
  String? _phone;
  String? _email;
  dynamic _verificationCode;
  dynamic _verificationExpireAt;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get phone => _phone;
  String? get email => _email;
  dynamic get verificationCode => _verificationCode;
  dynamic get verificationExpireAt => _verificationExpireAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['phone'] = _phone;
    map['email'] = _email;
    map['verification_code'] = _verificationCode;
    map['verification_expire_at'] = _verificationExpireAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}