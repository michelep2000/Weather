class Weather {
  String description;
  String icon;

  Weather({
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "icon": icon,
      };
}
