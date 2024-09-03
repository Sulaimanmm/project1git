class Model {
  final Data data;

  Model({
    required this.data,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  final List<UserProfile> userProfile;

  Data({
    required this.userProfile,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userProfile: List<UserProfile>.from(
            json["user_profile"].map((x) => UserProfile.fromJson(x))),
      );
}

class UserProfile {
  final int userId;
  final String userName;
  final String email;
  dynamic phone;
  final dynamic doorNo;
  final dynamic streetName;
  final dynamic city;
  final dynamic state;
  final int stateId;
  final String shortName;
  final int shippingCharge;
  final int codCharge;
  final dynamic pincode;
  final String referralCode;
  final int totalPointsEarned;
  final dynamic totalPointsReceived;
  final String couponName;
  final String couponCode;
  final String colorCode;
  final dynamic userImage;

  UserProfile({
    required this.userId,
    required this.userName,
    required this.email,
    required this.phone,
    required this.doorNo,
    required this.streetName,
    required this.city,
    required this.state,
    required this.stateId,
    required this.shortName,
    required this.shippingCharge,
    required this.codCharge,
    required this.pincode,
    required this.referralCode,
    required this.totalPointsEarned,
    required this.totalPointsReceived,
    required this.couponName,
    required this.couponCode,
    required this.colorCode,
    required this.userImage,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        userId: json["user_id"],
        userName: json["user_name"],
        email: json["email"],
        phone: json["phone"],
        doorNo: json["door_no"],
        streetName: json["street_name"],
        city: json["city"],
        state: json["state"],
        stateId: json["state_id"],
        shortName: json["short_name"],
        shippingCharge: json["shipping_charge"],
        codCharge: json["cod_charge"],
        pincode: json["pincode"],
        referralCode: json["referral_code"],
        totalPointsEarned: json["total_points_earned"],
        totalPointsReceived: json["total_points_received"],
        couponName: json["coupon_name"],
        couponCode: json["coupon_code"],
        colorCode: json["color_code"],
        userImage: json["user_image"],
      );
}
