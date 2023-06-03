class UserModel {
  bool? status;
  String? response;
  var request_id;
  bool? profile_exists;



  UserModel({this.status, this.response,this.request_id,this.profile_exists });

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    response = json['response'];
    request_id=json['request_id'];
    profile_exists=json['profile_exists'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['response'] = this.response;
    data['request_id'] = this.request_id;
    data['profile_exists'] = this.profile_exists;

    return data;
  }
}