
class Item {
  final String id;
  final String image;
  final String title;
  final bool isVerified;
  final String subtitle;
  final int numberOfMessage;

  Item({
    required this.id,
    required this.image,
    required this.title,
    this.isVerified = false,
    required this.subtitle ,
    required this.numberOfMessage,
  });
}