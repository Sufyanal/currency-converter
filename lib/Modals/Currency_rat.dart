import 'dart:convert';
class CurrencyRate {
  String? result;
  String? timeLastUpdate;
  String? baseCode;
  List <Rates> ratesList = [];
  Rates? rates;

  CurrencyRate(
      {this.result,
      this.baseCode,
      this.timeLastUpdate});

  CurrencyRate.fromJson(Map<String, dynamic> json) {
    result = json['result'];
   
   
    
    timeLastUpdate = json['time_last_update_utc'];
   
    baseCode = json['base_code'];

    json['rates'].forEach((key,value){
      ratesList.add(Rates(currancyName:key,rate:value));
    });
    print(ratesList.length);
  }



  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['result'] = this.result;
  //   data['provider'] = this.provider;
  //   data['documentation'] = this.documentation;
  //   data['terms_of_use'] = this.termsOfUse;
  //   data['time_last_update_unix'] = this.timeLastUpdateUnix;
  //   data['time_last_update_utc'] = this.timeLastUpdateUtc;
  //   data['time_next_update_unix'] = this.timeNextUpdateUnix;
  //   data['time_next_update_utc'] = this.timeNextUpdateUtc;
  //   data['time_eol_unix'] = this.timeEolUnix;
  //   data['base_code'] = this.baseCode;
  //   if (this.rates != null) {
  //     data['rates'] = this.rates!.toJson();
  //   }
  //   return data;
  // }
}

class Rates{
  String? currancyName;
  dynamic rate;

  Rates({this.currancyName,this.rate, });
  Rates.fromJson(key,value){

  }
}