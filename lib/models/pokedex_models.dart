

class Pokedex {
  final String name;
  final String url;

  Pokedex({
    required this.name,
    required this.url,
  });

  factory Pokedex.fromJson(Map<String, dynamic> json) => Pokedex(
        name: json["name"],
        url: json["url"],
      );

     
}
