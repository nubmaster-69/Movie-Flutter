// ignore_for_file: public_member_api_docs, sort_constructors_first
class Movie {
  final int id;
  final String title;
  final String? subtitle;
  final String? description;

  Movie({
    required this.id,
    required this.title,
    this.subtitle,
    this.description,
  });
}
