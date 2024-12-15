class Service {
  final int id;
  final int providerId;
  final String title;
  final String description;
  final String category;
  final String location;
  final String contactInfo;

  Service({
    required this.id,
    required this.providerId,
    required this.title,
    required this.description,
    required this.category,
    required this.location,
    required this.contactInfo,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      providerId: json['provider_id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      location: json['location'],
      contactInfo: json['contact_info'],
    );
  }
}
