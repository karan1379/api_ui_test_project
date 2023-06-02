class UserModel {
  bool? status;
  String? response;
  var request_id;



  UserModel({this.status, this.response,this.request_id });

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    response = json['response'];
    request_id=json['request_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['response'] = this.response;
    data['request_id'] = this.request_id;

    return data;
  }
}