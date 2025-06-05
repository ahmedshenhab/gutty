class LoginResponseModel {
  LoginResponseModel({this.token, this.role});
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(token: json['token'], role: json['role']);
  }
  String? token;
  String? role;
}
