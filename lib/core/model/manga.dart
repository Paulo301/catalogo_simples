class Manga {
  final String id;
  final String linkSelf;
  final String title;
  final String synopsis;
  final String posterImage;

  Manga({
    required this.id,
    required this.linkSelf,
    required this.title,
    required this.synopsis,
    required this.posterImage
  });

  factory Manga.fromJson(Map<String, dynamic> json) {
    return Manga(
      id: json['id'],
      linkSelf: json['links']["self"],
      title: json['attributes']['canonicalTitle'],
      synopsis: json['attributes']['synopsis'],
      posterImage: json['attributes']['posterImage']['original']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'linkSelf': linkSelf,
      'title': title,
      'synopsis': synopsis,
      'posterImage': posterImage,
    };
  }
}