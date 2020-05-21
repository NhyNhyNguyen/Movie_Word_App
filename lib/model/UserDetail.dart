class UserDetail {
  int id   ;
  String username;
  String fullName;
  String password;
  String email;
  String address;
  String phone;

  UserDetail({this.username,this.password, this.fullName, this.address, this.phone, this.email});



  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
        username:json['username'],
        fullName:json['fullName'],
        email:json['email'],
        address:json['address'],
        phone:json['phone'],
    );
  }
}