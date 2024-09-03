class Login {
  bool? status;
  String? message;
  Data? data;

  Login({
    this.status,
    this.message,
    this.data,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  int? id;
  String? name;
  String? token;
  int? userroleId;
  String? phone;
  String? email;
  bool? isOtpVerified;

  Data({
    this.id,
    this.name,
    this.token,
    this.userroleId,
    this.phone,
    this.email,
    this.isOtpVerified,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        token: json["token"],
        userroleId: json["userrole_id"],
        phone: json["phone"],
        email: json["email"],
        isOtpVerified: json["IsOTPVerified"],
      );
}
