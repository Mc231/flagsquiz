import 'package:flagsquiz/bussiness_logic/countries_provider.dart';
import 'package:flagsquiz/bussiness_logic/game_bloc.dart';
import 'package:flagsquiz/foundation/bloc_provider.dart';
import 'package:flagsquiz/foundation/random_item_picker.dart';
import 'package:flagsquiz/models/continent.dart';
import 'package:flagsquiz/models/country.dart';
import 'package:flagsquiz/ui/flags_quiz_app.dart';
import 'package:flagsquiz/ui/game/game_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class CountriesProviderMock extends Mock implements CountriesProvider {}

class RandomItemPickerMock extends Mock implements RandomItemPicker<Country> {}

// TODO: - Figure out this think about testing strategy
void main() {
  // This case produce game over
  testWidgets('Game screen for portrait orientation',
      (WidgetTester tester) async {
    // Given
    final continent = Continent.SA;
    final countriesProvider = CountriesProviderMock();
    final countries = [
      Country.fromJson({'name': 'Argentina', 'continent': 'SA', 'code': 'AR'})
    ];
    final randomItemPicker = RandomItemPickerMock();
    when(countriesProvider.provide())
        .thenAnswer((_) => Future.value(countries));
    final bloc = GameBloc(continent, countriesProvider, randomItemPicker);
    await tester.pumpWidget(
      FlagsQuizApp(homeWidget: BlocProvider(bloc: bloc, child: GameScreen())),
    );
    await tester.pump();
  });
}
