class MyUser {
  final String fullname;
  final String email;
  final String notlp;

  MyUser({
    required this.fullname,
    required this.email,
    required this.notlp,
  });

  Map<String, dynamic> toJson() {
    return {
      "fullname": fullname,
      "email": email,
      "notlp": notlp,
    };
  }

  factory MyUser.fromJson(Map<String, dynamic> json) {
    return MyUser(
      fullname: json["fullname"],
      email: json["email"],
      notlp: json["notlp"],
    );
  }
}

class DataJam {
  String? name;
  String? genre;
  String? descripe;
  String? avatar;
  String? upload;
  String? authorImageUrl;
  String? author;
  String? rating;
  String? views;

  DataJam({
    this.name,
    this.genre,
    this.descripe,
    this.upload,
    this.avatar,
    this.authorImageUrl,
    this.author,
    this.rating,
    this.views,
  });

  DataJam.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    genre = json['genre'];
    descripe = json['descripe'];
    avatar = json['avatar'];
    upload = json['upload'];
    authorImageUrl = json['authorImageUrl'];
    author = json['author'];
    rating = json['rating'];
    views = json['views'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataanalog = new Map<String, dynamic>();
    dataanalog['name'] = this.name;
    dataanalog['genre'] = this.genre;
    dataanalog['descripe'] = this.descripe;
    dataanalog['avatar'] = this.avatar;
    dataanalog['upload'] = this.upload;
    dataanalog['authorImageUrl'] = this.authorImageUrl;
    dataanalog['author'] = this.author;
    dataanalog['rating'] = this.rating;
    dataanalog['views'] = this.views;
    return dataanalog;
  }

  Map<String, dynamic> toJson2() {
    final Map<String, dynamic> datadigital = new Map<String, dynamic>();
    // data2['id'] = this.id;
    datadigital['name'] = this.name;
    datadigital['genre'] = this.genre;
    datadigital['descripe'] = this.descripe;
    datadigital['avatar'] = this.avatar;
    datadigital['authorImageUrl'] = this.authorImageUrl;
    datadigital['author'] = this.author;
    datadigital['rating'] = this.rating;
    datadigital['views'] = this.views;
    return datadigital;
  }

  Map<String, dynamic> toJson3() {
    final Map<String, dynamic> datasport = new Map<String, dynamic>();
    // dataaction['id'] = this.id;
    datasport['name'] = this.name;
    datasport['genre'] = this.genre;
    datasport['descripe'] = this.descripe;
    datasport['avatar'] = this.avatar;
    datasport['authorImageUrl'] = this.authorImageUrl;
    datasport['author'] = this.author;
    datasport['rating'] = this.rating;
    datasport['views'] = this.views;
    return datasport;
  }

  Map<String, dynamic> toJson4() {
    final Map<String, dynamic> datasmartwatch = new Map<String, dynamic>();
    // datafantasy['id'] = this.id;
    datasmartwatch['name'] = this.name;
    datasmartwatch['genre'] = this.genre;
    datasmartwatch['descripe'] = this.descripe;
    datasmartwatch['avatar'] = this.avatar;
    datasmartwatch['authorImageUrl'] = this.authorImageUrl;
    datasmartwatch['author'] = this.author;
    datasmartwatch['rating'] = this.rating;
    datasmartwatch['views'] = this.views;
    return datasmartwatch;
  }

  Map<String, dynamic> toJson5() {
    final Map<String, dynamic> dataformal = new Map<String, dynamic>();
    // dataformal['id'] = this.id;
    dataformal['name'] = this.name;
    dataformal['genre'] = this.genre;
    dataformal['descripe'] = this.descripe;
    dataformal['avatar'] = this.avatar;
    dataformal['authorImageUrl'] = this.authorImageUrl;
    dataformal['author'] = this.author;
    dataformal['rating'] = this.rating;
    dataformal['views'] = this.views;
    return dataformal;
  }

  Map<String, dynamic> toJson6() {
    final Map<String, dynamic> dataanalog2 = new Map<String, dynamic>();
    // dataanalog2['id'] = this.id;
    dataanalog2['name'] = this.name;
    dataanalog2['genre'] = this.genre;
    dataanalog2['descripe'] = this.descripe;
    dataanalog2['avatar'] = this.avatar;
    dataanalog2['authorImageUrl'] = this.authorImageUrl;
    dataanalog2['author'] = this.author;
    dataanalog2['rating'] = this.rating;
    dataanalog2['views'] = this.views;
    return dataanalog2;
  }
}
