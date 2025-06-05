// make model
// {
//   "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjYwZGE4YTBhLTdhMzYtNDAxMy05ZWU5LTdiNDYxMWY2MTdlMSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlVzZXIiLCJuYW1lIjoiYWhtZWRzaGVuaGFiIiwicGhvbmVfbnVtYmVyIjoiMDEyMzA4MzUyMjIiLCJleHAiOjE3NDkxNDM3NTIsImlzcyI6Ikd1dHR5IiwiYXVkIjoiR3V0dHkuY29tIn0.mD6Rjt6Diq00zqu_NPgHP-zZ2ZiCrMUnt9434YZDv30",
//   "role": "User"
// }

class RegisterResponseModel {

  RegisterResponseModel({this.token, this.role});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterResponseModel(token: json['token'], role: json['role']);
  final String? token, role;
}
