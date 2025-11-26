class UsersModel {
  int? usersId;
  String? usersName;
  String? usersPassword;
  String? usersEmail;
  String? usersPhone;
  String? usersVerifycode;
  String? usersApprove;
  String? usersCreate;

  UsersModel(
      {this.usersId,
      this.usersName,
      this.usersPassword,
      this.usersEmail,
      this.usersPhone,
      this.usersVerifycode,
      this.usersApprove,
      this.usersCreate});

  UsersModel.fromJson(Map<String, dynamic> json) {
    usersId = json['users_id'];
    usersName = json['users_name'];
    usersPassword = json['users_password'];
    usersEmail = json['users_email'];
    usersPhone = json['users_phone'];
    usersVerifycode = json['users_verifycode'];
    usersApprove = json['users_approve'];
    usersCreate = json['users_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['users_id'] = this.usersId;
    data['users_name'] = this.usersName;
    data['users_password'] = this.usersPassword;
    data['users_email'] = this.usersEmail;
    data['users_phone'] = this.usersPhone;
    data['users_verifycode'] = this.usersVerifycode;
    data['users_approve'] = this.usersApprove;
    data['users_create'] = this.usersCreate;
    return data;
  }
}
