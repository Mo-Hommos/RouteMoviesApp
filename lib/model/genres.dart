class genres{
  int id;
  String name;
  genres({required this.id,required this.name});
  factory genres.fromJson(Map<String,dynamic> json){
    return genres(
        name: json['name'],
        id: json['id']
    );
  }
}