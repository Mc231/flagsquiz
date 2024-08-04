/// Retrieves an enum value from a string representation.
///
/// The `getEnumFromString` function is a generic utility that helps convert
/// a string into a corresponding enum value. It iterates through the given
/// enum values and finds the one that matches the provided string. If no
/// match is found, it returns a specified default value.
///
/// This function is particularly useful in scenarios where enum values
/// are stored as strings (e.g., in a database or JSON) and need to be
/// converted back to enum types.
///
/// Example usage:
/// ```dart
/// enum Color { red, green, blue }
///
/// String colorName = 'green';
/// Color color = getEnumFromString(Color.values, colorName, Color.red);
/// print(color); // Output: Color.green
/// ```
///
/// [values] is an iterable of enum values to search through.
/// [value] is the string representation of the desired enum value.
/// [defaultValue] is the value to return if no match is found.
///
/// Returns the enum value that matches the given string, or [defaultValue]
/// if no match is found.
T getEnumFromString<T>(Iterable<T> values, String value, T defaultValue) {
  return values.firstWhere((type) => type.toString().split('.').last == value,
      orElse: () => defaultValue);
}