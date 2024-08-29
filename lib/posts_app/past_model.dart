class Posts {
  final int id;
  final String title;
  final String body;

  const Posts({
    required this.id,
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'id': id,
      'title': title,
      'body': body
    };
    return data;
  }

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}


//  data['id'] = id;
//     data['title'] = title;
//     data['body'] = body;