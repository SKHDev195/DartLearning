void main() async {
  DataService dataService = DataService();
  String data = await dataService.getData();
  print(data);
}

class DataService {
  Future getData() async {
    final String dataFromCloud = await _getDataFromCloud();
    final String parsedData = await _parseDataFromCloud(dataFromCloud: dataFromCloud);

    /*final String parsedData = await _getDataFromCloud().then((dataFromCloud) async {
      return await _parseDataFromCloud(dataFromCloud: dataFromCloud);
    });*/

    return parsedData;
  }

  Future<String> _getDataFromCloud() async {
    await Future.delayed(Duration(seconds: 5));
    print('get data finished');
    return 'fake data';
  }

  Future<String> _parseDataFromCloud({required String dataFromCloud}) async {
    await Future.delayed(Duration(seconds: 3));
    print('parse data finished');
    return 'fake parsed data';
  }
}