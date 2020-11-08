class ServiceCategoryModel {
  String name;
  List<Showcase> showcase;
  ServiceCategoryModel({this.name, this.showcase});

  ServiceCategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['showcase'] != null) {
      showcase = new List<Showcase>();
      json['showcase'].forEach((v) {
        showcase.add(new Showcase.fromJson(v));
      });
    }
  }
}

class Showcase {
  String offer;
  Map<String, String> displayName;
  String imageUrl;
  Showcase({this.offer, this.displayName, this.imageUrl});
  Showcase.fromJson(Map<String, dynamic> json) {
    offer = json['offer'];
    displayName = json['displayName'] != null ? json['displayName'] : null;
    imageUrl = json['image_url'];
  }
}
