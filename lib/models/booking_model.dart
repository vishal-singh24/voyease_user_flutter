class BookingsModel {
  String? bookingTime;
  String? arrivalTime;
  int? groupSize;
  List<int>? languages;
  String? guideType;
  Location? location;

  BookingsModel(
      {this.bookingTime,
      this.arrivalTime,
      this.groupSize,
      this.languages,
      this.guideType,
      this.location});

  BookingsModel.fromJson(Map<String, dynamic> json) {
    bookingTime = json['bookingTime'];
    arrivalTime = json['arrivalTime'];
    groupSize = json['groupSize'];
    languages = json['languages'].cast<int>();
    guideType = json['guideType'];
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final  data = <String, dynamic>{};
    data['bookingTime'] = bookingTime;
    data['arrivalTime'] = arrivalTime;
    data['groupSize'] = groupSize;
    data['languages'] = languages;
    data['guideType'] = guideType;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    return data;
  }
}

class Location {
  int? latitude;
  int? longitude;

  Location({this.latitude, this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final  data =  <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}