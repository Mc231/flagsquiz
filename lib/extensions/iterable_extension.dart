T getEnumFromString<T>(Iterable<T> values, String value, T defaultValue) {
  return values.firstWhere((type) => type.toString().split('.').last == value,
      orElse: () => defaultValue);
}
