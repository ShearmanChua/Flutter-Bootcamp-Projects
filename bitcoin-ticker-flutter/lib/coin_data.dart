import 'networking.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = '5BD8FD2F-FF48-4E57-B1FD-FBC3BA2891FA';
const coinapiURL = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future getCoindata(String currency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      String url = '$coinapiURL/$crypto/$currency?apikey=$apiKey';
      print(url);
      NetworkHelper networkHelper = NetworkHelper(url);
      var coinData = await networkHelper.getData();
      double lastPrice = coinData['rate'];
      cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
    }
    return cryptoPrices;
  }
}
