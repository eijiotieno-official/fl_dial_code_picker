import 'dart:convert';

/// Represents a country with its basic information including name, flag, code, and dial code.
///
/// This class is used throughout the dial code picker to represent country data.
/// It provides methods for serialization, deserialization, and comparison.
///
/// Example:
/// ```dart
/// final country = Country(
///   name: "United States",
///   flag: "🇺🇸",
///   code: "US",
///   dial: "+1",
/// );
/// ```
class Country {
  /// The full name of the country (e.g., "United States", "United Kingdom").
  final String name;

  /// The flag emoji representing the country (e.g., "🇺🇸", "🇬🇧").
  final String flag;

  /// The ISO 3166-1 alpha-2 country code (e.g., "US", "GB").
  final String code;

  /// The international dial code with plus sign (e.g., "+1", "+44").
  final String dial;

  /// Creates a new Country instance.
  ///
  /// All parameters are required and should not be null.
  Country({
    required this.name,
    required this.flag,
    required this.code,
    required this.dial,
  });

  /// Creates a copy of this Country with the given fields replaced by new values.
  ///
  /// Returns a new Country instance with updated values while keeping the original unchanged.
  Country copyWith({String? name, String? flag, String? code, String? dial}) {
    return Country(
      name: name ?? this.name,
      flag: flag ?? this.flag,
      code: code ?? this.code,
      dial: dial ?? this.dial,
    );
  }

  /// Converts the Country to a Map representation.
  ///
  /// Useful for serialization and storage purposes.
  Map<String, dynamic> toMap() {
    return {'name': name, 'flag': flag, 'code': code, 'dial': dial};
  }

  /// Creates a Country instance from a Map.
  ///
  /// Handles null values by providing empty strings as defaults.
  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      name: map['name'] ?? '',
      flag: map['flag'] ?? '',
      code: map['code'] ?? '',
      dial: map['dial'] ?? '',
    );
  }

  /// Converts the Country to a JSON string.
  ///
  /// Uses the [toMap] method for the conversion.
  String toJson() => json.encode(toMap());

  /// Creates a Country instance from a JSON string.
  ///
  /// Parses the JSON and uses [fromMap] for the conversion.
  factory Country.fromJson(String source) =>
      Country.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Country(name: $name, flag: $flag, code: $code, dial: $dial)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Country &&
        other.name == name &&
        other.flag == flag &&
        other.code == code &&
        other.dial == dial;
  }

  @override
  int get hashCode {
    return name.hashCode ^ flag.hashCode ^ code.hashCode ^ dial.hashCode;
  }
}
