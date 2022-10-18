// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio_project/features/dio_test/models/location_model.dart';

class PostAnnoucementsModel {
  final String? title;
  final String? description;
  final int? annoucementType;
  final String? expiresIn;
  final String? files;
  final String? salary;
  final String? workArea;
  final LocationModel? location;
  PostAnnoucementsModel({
    this.title,
    this.description,
    this.annoucementType,
    this.expiresIn,
    this.files,
    this.salary,
    this.workArea,
    this.location,
  });

  factory PostAnnoucementsModel.fromJson(Map<String, dynamic> json) {
    return PostAnnoucementsModel(
      title: json['title'],
      description: json['description'],
      annoucementType: json['annoucementType'],
      expiresIn: json['expiresIn'],
      files: json['files'],
      salary: json['salary'],
      workArea: json['workArea'],
      location: json['location'],
    );
  }
}
