import 'dart:convert';

class CatResponse {
  String? id;
  String? imgUrl;
  int? width;
  int? height;

  CatResponse({this.id, this.imgUrl, this.width, this.height});

  factory CatResponse.fromJson(Map<String, dynamic> json) {
    return CatResponse(
        id: json["id"],
        imgUrl: json["url"],
        width: json["width"],
        height: json["height"]);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = imgUrl;
    map['width'] = width;
    map['height'] = height;
    return map;
  }
}

List<CatResponse> jsonToCatResponseList(String jsonData) {
  try {
    return json.decode(jsonData).map((data) => CatResponse.fromJson(data));
  } catch (e) {
    return <CatResponse>[];
  }
}
