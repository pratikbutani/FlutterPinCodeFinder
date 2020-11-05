class PostOffice {
  String name;
  Null description;
  String branchType;
  String deliveryStatus;
  String circle;
  String district;
  String division;
  String region;
  String state;
  String country;
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

  PostOffice.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    description = json['Description'];
    branchType = json['BranchType'];
    deliveryStatus = json['DeliveryStatus'];
    circle = json['Circle'];
    district = json['District'];
    division = json['Division'];
    region = json['Region'];
    state = json['State'];
    country = json['Country'];
    pincode = json['Pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Description'] = this.description;
    data['BranchType'] = this.branchType;
    data['DeliveryStatus'] = this.deliveryStatus;
    data['Circle'] = this.circle;
    data['District'] = this.district;
    data['Division'] = this.division;
    data['Region'] = this.region;
    data['State'] = this.state;
    data['Country'] = this.country;
    data['Pincode'] = this.pincode;
    return data;
  }
}

class PostalModel {
  String message;
  String status;
  List<PostOffice> postOffice;

  PostalModel({this.message, this.status, this.postOffice});

  PostalModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    status = json['Status'];
    if (json['PostOffice'] != null) {
      postOffice = new List<PostOffice>();
      json['PostOffice'].forEach((v) {
        postOffice.add(new PostOffice.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    data['Status'] = this.status;
    if (this.postOffice != null) {
      data['PostOffice'] = this.postOffice.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
