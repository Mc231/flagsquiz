

import 'package:flagsquiz/bloc/game_bloc.dart';
import 'package:flagsquiz/countries_provider.dart';
import 'package:flagsquiz/models/country.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class CountriesProviderMock extends Mock implements CountriesProvider {}

void main() {
  GameBloc bloc;
  CountriesProvider provider;

  setUp(() {
    provider = CountriesProviderMock();
    bloc = GameBloc(null, provider);
  });

  tearDown(() {
    bloc.dispose();
  });

  test('initial state is correct', () {
    expect(bloc.initialState, isInstanceOf<LoadingState>());
  });

  test('initial load called correctly', () async {
    var expectedDataSource = [
      Country.fromJson({'name': 'Ukraine', 'continent': 'EU', 'code': 'UK'}),
      Country.fromJson({'name': 'Poland', 'continent': 'EU', 'code': 'PL'}),
      Country.fromJson({'name': 'Slovakia', 'continent': 'EU', 'code': 'SK'}),
      Country.fromJson({'name': 'Romania', 'continent': 'EU', 'code': 'RO'}),
      Country.fromJson({'name': 'Belarus', 'continent': 'EU', 'code': 'BY'}),
    ];
    when(provider.provide())
        .thenAnswer((realInvocation) => Future.value(expectedDataSource));
    await bloc.initialLoad();
    expect(bloc.stream, emitsInOrder([isInstanceOf<QuestionState>()]));
  });
}
//
//  group('Test resend activation', () {
//    test('resend success', () {
//      when(api.resendActivation(user.email)).thenAnswer((_) => Future.value());
//      bloc.resendActivation();
//      bloc.onActivationResend = () {
//        expect(
//            bloc.stream,
//            emitsInOrder([
//              AccountActivationState.resentEmailRequestInProgress,
//              AccountActivationState.completed
//            ]));
//      };
//    });
//    test('resend failed with server exception', () {
//      var map = json.decode('{"error": {"code": "404", "meesage": "test"}}') as Map;
//      var expectedError = LMServerException.fromJson(map);
//      when(api.resendActivation(user.email))
//          .thenAnswer((_) async => throw expectedError);
//      bloc.resendActivation();
//      bloc.errorCallback = (error) {
//        expect(error, equals(expectedError));
//        expect(
//            bloc.stream,
//            emitsInOrder([
//              AccountActivationState.resentEmailRequestInProgress,
//              AccountActivationState.completed
//            ]));
//      };
//    });
//  });
//
//  group('Timer tests', () {
//    test('start returns activated user', () {
//      var expectedUser = LMWebUser.fromJson(
//          json.decode('{"email": "test@gmail.com", "email_confirmation": 1}') as Map);
//      when(api.getInfo(user.apiKey))
//          .thenAnswer((_) => Future.value(expectedUser));
//      bloc.startActivationTimer();
//      expectAsync0((){
//        bloc.onAccountActivated = (user) {
//          expect(user, equals(user));
//          expect(user.isEmailConfirmed, true);
//        };
//      });
//
//    });
//    test('start returns server exception', () {
//      var map = json.decode('{"error": {"code": "404", "meesage": "test"}}') as Map;
//      var expectedError = LMServerException.fromJson(map);
//      when(api.getInfo(user.apiKey))
//          .thenAnswer((_) async => throw expectedError);
//      bloc.startActivationTimer();
//      bloc.errorCallback = (error) {
//        expect(expectedError, equals(error));
//      };
//    });
//  });

