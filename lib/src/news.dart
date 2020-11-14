class News{
  int userId;
  int id;
  String title;
  String body;

  News({this.userId, this.id, this.title, this.body});

  @override
  String toString() {
    // TODO: implement toString
    return 'Data diambil: $userId, $id, $title, $body';
  }

  factory News.fromJson(Map<String, dynamic> json){
    return News(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"]
    );
  }

}