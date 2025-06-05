class RegisterRequestModel {

  RegisterRequestModel({
    this.firstName,
    this.middleName,
    this.lastName,
    this.phoneNumber,
    this.password,
    this.mainAddress,
    this.secondaryAddress,
    this.cityId,
  });

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    return RegisterRequestModel(
      firstName: json['firstName'],
      middleName: json['middleName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
      mainAddress: json['mainAddress'],
      secondaryAddress: json['secondaryAddress'],
      cityId: json['cityId'],
    );
  }
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? phoneNumber;
  final String? password;
  final String? mainAddress;
  final String? secondaryAddress;
  final int? cityId;

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'password': password,
      'mainAddress': mainAddress,
      'secondaryAddress': secondaryAddress,
      'cityId': cityId,
    };
  }
}
