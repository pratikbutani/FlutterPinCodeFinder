// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postoffice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostalModel _$PostalModelFromJson(Map<String, dynamic> json) {
  return PostalModel(
    message: json['Message'] as String,
    status: json['Status'] as String,
    postOffice: (json['PostOffice'] as List)
        ?.map((e) =>
            e == null ? null : PostOffice.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PostalModelToJson(PostalModel instance) =>
    <String, dynamic>{
      'Message': instance.message,
      'Status': instance.status,
      'PostOffice': instance.postOffice,
    };

PostOffice _$PostOfficeFromJson(Map<String, dynamic> json) {
  return PostOffice(
    name: json['Name'] as String,
    description: json['Description'] as String,
    branchType: json['BranchType'] as String,
    deliveryStatus: json['DeliveryStatus'] as String,
    circle: json['Circle'] as String,
    district: json['District'] as String,
    division: json['Division'] as String,
    region: json['Region'] as String,
    state: json['State'] as String,
    country: json['Country'] as String,
    pincode: json['Pincode'] as String,
  );
}

Map<String, dynamic> _$PostOfficeToJson(PostOffice instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Description': instance.description,
      'BranchType': instance.branchType,
      'DeliveryStatus': instance.deliveryStatus,
      'Circle': instance.circle,
      'District': instance.district,
      'Division': instance.division,
      'Region': instance.region,
      'State': instance.state,
      'Country': instance.country,
      'Pincode': instance.pincode,
    };
