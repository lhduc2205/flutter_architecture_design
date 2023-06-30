abstract class Photo {
  const Photo({
    this.id,
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  final int? id;
  final int albumId;
  final String title;
  final String url;
  final String thumbnailUrl;
}
