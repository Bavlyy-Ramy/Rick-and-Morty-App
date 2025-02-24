class Character {
  late int charId;
  late String name;
  late String status;
  late String species;
  late String type;
  late String gender;
  late String image;
  late Origin origin;
  late Location location;
  late List<dynamic> episodesAppearedIn;
  late List<int> episodeNumbers;
  Character.fromJson(Map<String, dynamic> json) {
    charId = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    image = json['image'];
    origin = Origin.fromJson(json['origin']);
    location = Location.fromJson(json['location']);
    episodesAppearedIn = json['episode'];
    

    episodeNumbers = episodesAppearedIn.map((url) {
    RegExp regExp = RegExp(r'/(\d+)$');
    Match? match = regExp.firstMatch(url);
    return match != null ? int.parse(match.group(1)!) : 0;
  }).toList();
  }

 
}
class Origin {
  String? name;
  String? url;

  Origin({this.name, this.url});

  Origin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}

class Location {
  String? name;
  String? url;

  Location({this.name, this.url});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
