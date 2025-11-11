class Source {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? lanaguge;
  String? country;

  Source({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.lanaguge,
    this.country,
  });

 factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      category: json['category'] ?? '',
      lanaguge: json['language'] ?? '',
      country: json['country'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "url": url,
      "category": category,
      "lanaguge": lanaguge,
      "country": country,
    };
  }
}
