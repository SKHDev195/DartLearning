import 'package:advisor/0_data/datasources/advice_remote_datasource.dart';
import 'package:advisor/0_data/exceptions/exceptions.dart';
import 'package:advisor/0_data/models/advice_model.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart';

import 'advice_remote_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Client>()])
void main() {
  final mockClient = MockClient();
  final adviceRemoteDatasourceTest =
      AdviceRemoteDatasourceImpl(client: mockClient);

  group('AdviceRemoteDatasource', () {
    group('should return AdviceModel', () {
      test('when Client response is 200 and has valid data', () async {
        const responseBody = '{"advice": "test advice", "advice_id": 1}';

        when(mockClient.get(
          Uri.parse('https://api.flutter-community.com/api/v1/advice'),
          headers: {'content-type': 'application/json'},
        )).thenAnswer(
          (realInvocation) => Future.value(
            Response(responseBody, 200),
          ),
        );

        final result =
            await adviceRemoteDatasourceTest.getRandomAdviceFromApi();

        expect(
          result,
          AdviceModel(advice: 'test advice', adviceId: 1),
        );
      });
    });
  });

  group('Should throw', () {
    test('a ServerException when client response was not 200', () {
      when(mockClient.get(
        Uri.parse('https://api.flutter-community.com/api/v1/advice'),
        headers: {
          'content-type': 'application/json',
        },
      )).thenAnswer((realInvocation) => Future.value(Response('', 201)));

      expect(() => adviceRemoteDatasourceTest.getRandomAdviceFromApi(),
          throwsA(isA<ServerException>()));
    });

    test('a TypeError when client response was 200 and has no valid data', () {
      const responseBody = '{"advice": "test advice"}';
      when(mockClient.get(
        Uri.parse('https://api.flutter-community.com/api/v1/advice'),
        headers: {
          'content-type': 'application/json',
        },
      )).thenAnswer(
          (realInvocation) => Future.value(Response(responseBody, 200)));

      expect(() => adviceRemoteDatasourceTest.getRandomAdviceFromApi(),
          throwsA(isA<TypeError>()));
    });
  });
}
