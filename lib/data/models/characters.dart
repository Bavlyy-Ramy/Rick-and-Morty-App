
class Characters {
  late int charId;
  late String name;
  late String status;
  late String species;
  late String type;
  late String gender;
  late String image;
  late List<String> episodesAppearedIn;

  Characters.fromJson(Map<String,dynamic> json){
    charId = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    image = json['image'];
    episodesAppearedIn = json['episode'];
    
  }
}