class UserModel{
  int? userId;
  int? id;
  String? title;
  String? body;

  UserModel({this.userId,this.id,this.title,this.body});

  factory UserModel.fromJson(Map<String,dynamic> json){
   return UserModel(
      userId:json["userId"] ?? 0,
      id:json["id"] ?? 0,
      title:json["title"] ?? "",
      body:json["body"] ?? ""
    );
  }

  Map<String,dynamic> toJson(){
    return {
      "userId":userId,
      "id":id,
      "title":title,
      "body":body
    };
  }
  
}

// class UserListModel{
//   List<UserModel> ?userList;

//   UserListModel({this.userList});

//   factory UserListModel .fromJson(Map<String,dynamic> json){
//     return UserListModel(

//       userList: List<UserModel>.from(json.map((key, value) => null)))
//       );
//   }
// }