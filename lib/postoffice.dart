import 'package:json_annotation/json_annotation.dart';

part 'postoffice.g.dart';

@JsonSerializable()
class PostalModel {
  @JsonKey(name: 'Message')
  String message;
  @JsonKey(name: 'Status')
  String status;
  @JsonKey(name: 'PostOffice')
  List<PostOffice> postOffice;

  PostalModel({this.message, this.status, this.postOffice});

  factory PostalModel.fromJson(Map<String, dynamic> json) =>
      _$PostalModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostalModelToJson(this);
}

@JsonSerializable()
class PostOffice {
  @JsonKey(name: 'Name')
  String name;
  @JsonKey(name: 'Description')
  String description;
  @JsonKey(name: 'BranchType')
  String branchType;
  @JsonKey(name: 'DeliveryStatus')
  String deliveryStatus;
  @JsonKey(name: 'Circle')
  String circle;
  @JsonKey(name: 'District')
  String district;
  @JsonKey(name: 'Division')
  String division;
  @JsonKey(name: 'Region')
  String region;
  @JsonKey(name: 'State')
  String state;
  @JsonKey(name: 'Country')
  String country;
  @JsonKey(name: 'Pincode')
  String pincode;

  PostOffice(
      {this.name,
      this.description,
      this.branchType,
      this.deliveryStatus,
      this.circle,
      this.district,
      this.division,
      this.region,
      this.state,
      this.country,
      this.pincode});

  factory PostOffice.fromJson(Map<String, dynamic> json) =>
      _$PostOfficeFromJson(json);

  Map<String, dynamic> toJson() => _$PostOfficeToJson(this);
}
