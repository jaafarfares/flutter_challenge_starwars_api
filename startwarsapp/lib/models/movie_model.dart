class MovieModel {
  int? count;
  Null? next;
  Null? previous;
  List<Results>? results;

  MovieModel({this.count, this.next, this.previous, this.results});

  MovieModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Results {
  String? title;
  int? episodeId;
  String? openingCrawl;
  String? director;
  String? producer;
  String? releaseDate;
  List<String> characters = [];
  List<String> planets = [];
  List<String> starships = [];
  List<String> vehicles = [];
  List<String> species = [];
  String? created;
  String? edited;
  String? url;

  Results({
    this.title,
    this.episodeId,
    this.openingCrawl,
    this.director,
    this.producer,
    this.releaseDate,
    List<String>? characters,
    List<String>? planets,
    List<String>? starships,
    List<String>? vehicles,
    List<String>? species,
    this.created,
    this.edited,
    this.url,
  }) {
    this.characters = characters ?? [];
    this.planets = planets ?? [];
    this.starships = starships ?? [];
    this.vehicles = vehicles ?? [];
    this.species = species ?? [];
  }

  Results.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    episodeId = json['episode_id'];
    openingCrawl = json['opening_crawl'];
    director = json['director'];
    producer = json['producer'];
    releaseDate = json['release_date'];
    characters = List<String>.from(json['characters'] ?? []);
    planets = List<String>.from(json['planets'] ?? []);
    starships = List<String>.from(json['starships'] ?? []);
    vehicles = List<String>.from(json['vehicles'] ?? []);
    species = List<String>.from(json['species'] ?? []);
    created = json['created'];
    edited = json['edited'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'title': title,
      'episode_id': episodeId,
      'opening_crawl': openingCrawl,
      'director': director,
      'producer': producer,
      'release_date': releaseDate,
      'characters': characters,
      'planets': planets,
      'starships': starships,
      'vehicles': vehicles,
      'species': species,
      'created': created,
      'edited': edited,
      'url': url,
    };

    return data;
  }
}

