class SilverModel {
  final String name;
  final double price;
  final String symbol;
  final DateTime updatedAt;
  final String updatedAtReadable;

  const SilverModel({
    required this.name,
    required this.price,
    required this.symbol,
    required this.updatedAt,
    required this.updatedAtReadable,
  });

  factory SilverModel.fromJson(Map<String, dynamic> json) {
    return SilverModel(
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
}
