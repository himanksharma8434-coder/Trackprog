class Exercise {
  final String id;
  final String name;
  final bool isCustom;

  Exercise({
    required this.id,
    required this.name,
    this.isCustom = false,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'isCustom': isCustom,
      };

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
        id: json['id'],
        name: json['name'],
        isCustom: json['isCustom'] ?? false,
      );
}
