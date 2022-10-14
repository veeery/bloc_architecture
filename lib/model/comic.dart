class Comic {

  String? url;
  String? slug;
  String? imageUrl;
  String? title;
  String? lastChapter;

  Comic({
    this.url,
    this.slug,
    this.imageUrl,
    this.title,
    this.lastChapter
  });


  factory Comic.fromJson(Map<String, dynamic> json) {
    return Comic(
        url: json['url'] ?? "",
        title: json['title'] ?? "",
        imageUrl: json['image'] ?? "",
        slug: json['slug'] ?? "",
        lastChapter: json['last_chapter'] ?? ""
    );
  }

  @override
  String toString() {
    return 'Comic{url: $url, slug: $slug, image: $imageUrl, title: $title, last_chapter: $lastChapter}';
  }

  List<Object> get props => [url!, slug!, imageUrl!, title!, lastChapter!];

}