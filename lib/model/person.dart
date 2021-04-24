
class Person {
  final int id;
  final double popularity;
  final String name;
  final String profileImage;
  final String know;
 
  Person({
    this.id,
    this.popularity,
    this.profileImage,
    this.name,
    this.know,
  });

  Person.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        popularity = json['popularity'],
        name = json['name'],
        profileImage = json['profile_path'],
        know = json['known_for_department'];
        
}