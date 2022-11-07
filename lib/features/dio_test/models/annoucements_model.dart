// ignore_for_file: public_member_api_docs, sort_constructors_first
class AnnoucementsModel {
  final String? title;
  final String? description;
  final String? userId;
  final String? userName;
  final String? createdAt;
  final String? id;
  final int? announcementType;
  final List<String>? files;
  final bool? isFavorite;
  AnnoucementsModel({
    this.title,
    this.description,
    this.userId,
    this.userName,
    this.createdAt,
    this.id,
    this.announcementType,
    this.files,
    this.isFavorite,
  });

  factory AnnoucementsModel.fromJson(Map<String, dynamic> json) {
    return AnnoucementsModel(
      id: json['id'],
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      userId: json['userId'],
      userName: json['userName'] ?? '',
      createdAt: json['createdAt'] ?? '',
      announcementType: json['announcementType'],
      files: json['files'] != null ? List<String>.from(json['files']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['userId'] = userId;
    data['userName'] = userName;
    data['createdAt'] = createdAt;
    data['files'] = files;
    data['announcementType'] = announcementType;
    return data;
  }
}
