class GoldModel {
  final String name;
  final double price;
  final String symbol;
  final DateTime updatedAt;
  final String updatedAtReadable;

  const GoldModel({
    required this.name,
    required this.price,
    required this.symbol,
    required this.updatedAt,
    required this.updatedAtReadable,
  });

  factory GoldModel.fromJson(Map<String, dynamic> json) {
    return GoldModel(
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      symbol: json['symbol'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      updatedAtReadable: json['updatedAtReadable'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'price': price,
    'symbol': symbol,
    'updatedAt': updatedAt.toUtc().toIso8601String(),
    'updatedAtReadable': updatedAtReadable,
  };

  GoldModel copyWith({
    String? name,
    double? price,
    String? symbol,
    DateTime? updatedAt,
    String? updatedAtReadable,
  }) {
    return GoldModel(
      name: name ?? this.name,
      price: price ?? this.price,
      symbol: symbol ?? this.symbol,
      updatedAt: updatedAt ?? this.updatedAt,
      updatedAtReadable: updatedAtReadable ?? this.updatedAtReadable,
    );
  }
}
