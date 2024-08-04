/// Represents the continents of the world.
///
/// The `Continent` enum defines a set of constants representing the
/// continents of the world. It provides a way to categorize or filter
/// data based on geographic regions, making it useful for applications
/// that require continent-specific functionality, such as quizzes,
/// data analysis, or geographical filtering.
///
/// The enum includes an additional `all` value to represent all continents
/// collectively, which can be used in scenarios where no specific continent
/// is selected.
///
/// Enum Values:
/// - `all`: Represents all continents.
/// - `af`: Represents Africa.
/// - `eu`: Represents Europe.
/// - `as`: Represents Asia.
/// - `na`: Represents North America.
/// - `sa`: Represents South America.
/// - `oc`: Represents Oceania.
enum Continent {
  /// Represents all continents.
  all,

  /// Represents Africa.
  af,

  /// Represents Europe.
  eu,

  /// Represents Asia.
  as,

  /// Represents North America.
  na,

  /// Represents South America.
  sa,

  /// Represents Oceania.
  oc,
}