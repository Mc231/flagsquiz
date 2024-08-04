import 'package:flags_quiz/models/continent.dart';
import 'package:flags_quiz/models/country.dart';

/// A data source for managing and retrieving country information.
///
/// The `CountriesDataSource` class provides a way to store and filter
/// a list of countries based on specific criteria, such as the continent
/// they belong to. It serves as an interface between the raw data and
/// the application logic, making it easier to access and manipulate
/// country data.
///
class CountriesDataSource {
  /// A list of countries available in the data source.
  final List<Country> dataSource;

  /// Creates a new `CountriesDataSource` with the given list of countries.
  ///
  /// [dataSource] is a list of `Country` objects that this data source
  /// will manage and filter.
  CountriesDataSource(this.dataSource);

  /// Retrieves a list of countries filtered by the specified continent.
  ///
  /// [continent] is the continent to filter countries by. If the
  /// continent is `Continent.all`, all countries are returned.
  ///
  /// Returns a list of `Country` objects that belong to the specified continent.
  ///
  /// Note: This method modifies the original list by removing countries
  /// that do not belong to the specified continent. To avoid altering
  /// the original data, consider returning a new filtered list instead.
  List<Country> getByContinent(Continent continent) {
    var result = List<Country>.from(dataSource);
    if (continent == Continent.all) {
      return result;
    }
    result.removeWhere((element) => element.continent != continent);
    return result;
  }
}