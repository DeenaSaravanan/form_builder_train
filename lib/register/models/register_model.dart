class RegisterModel {
  final String username;
  final String email;
  final String mobile;
  final String country;
  final String city;


  const RegisterModel({
    required this.username,
    required this.email,
    required this.mobile,
    required this.country,
    required this.city,
    
  });

  
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'mobile': mobile,
      'country': country,
      'city': city,
     
    };
  }

 
  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      username: json['username'],
      email: json['email'],
      mobile: json['mobile'],
      country: json['country'],
      city: json['city']
    );
  }
}
