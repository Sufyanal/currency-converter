import 'dart:convert';

import 'package:currancyrate/Widgets/bottom_sheets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Modals/Currency_rat.dart';
import '../controller/cont.dart';

class Currencies extends StatefulWidget {
  const Currencies({super.key,});
   
  @override
  State<Currencies> createState() => _CurrenciesState();
}

class _CurrenciesState extends State<Currencies> {
   
   CurrencyRate currency = CurrencyRate();
   Rates rate = Rates();

   List<CurrencyRate> currancyrate= [];
   
   TextEditingController TextFieldController = TextEditingController();

   String? currancyName;
   
   @override
    void initState() {
    getCurrencyRate();
    super.initState();
  }
   Future<void> getCurrencyRate({String baseCode = "USD"})async{
    http.Response response = await http.get(Uri.parse("https://open.er-api.com/v6/latest/$baseCode"));
    print(response.statusCode);
    print(response.body);
   
   setState(() {
     currency = CurrencyRate.fromJson(jsonDecode(response.body));
    
   });

   }
  @override
  Widget build(BuildContext context) {

   
    return SafeArea( 
      
      child:  Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/BackgroundDesign.png"),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topLeft,
                    opacity: 0.2)),
        child: Scaffold(
           resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xff0F111E),
          body: Column(
            
            mainAxisAlignment: MainAxisAlignment.start,
            children:
             [
              
              const SizedBox(height: 10,),
             Text("Currency Converter",
             style: Theme.of(context).textTheme.bodyLarge,
             ),
             const SizedBox(height: 10,),
      
          //   Search TExtField in Currency
      
             Padding(
               padding: const EdgeInsets.all(20),
               child: TextField(
                controller: TextFieldController,
                onChanged: (value){
                 currancyName = value;
                 getCurrencyRate(baseCode:currancyName!);
                },
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  suffixStyle: TextStyle(color:Color(0xff212436) ),
                  fillColor: Color(0xff212436),
                  focusColor: null,
                  filled: true,
                  disabledBorder: null,
                   icon: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.search,color: Colors.white,),
                  ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                hintText: "Type your currency",
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white,fontWeight: FontWeight.w600)
                ),
               ),
             ),
      //   TextField in Currency
      
      //  Convert Currency 
      
             const SizedBox(height: 10,),
             Text("Current Currency",
             style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
             ),
             const SizedBox(height: 5,),
             Text(
              "${currency.baseCode??"--"}",
             style: Theme.of(context).textTheme.bodyLarge,),
             
             Container(
               decoration: BoxDecoration(
                            color: const Color(0xff2F2F34),
                            borderRadius: BorderRadius.circular(30)),
              child: Text("${currency.timeLastUpdate?.replaceAll('00:02:31 +0000',"")}")),
            
             const SizedBox(height: 30,),
      
            //   Convert Currency
      
            //  List Diffrent Currency and Calculate
      
             Expanded(
               child: ListView.builder(
                itemCount: currency.ratesList.length,
                itemBuilder:(context,index) {
                  return  InkWell(
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
           
              shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15))),
            backgroundColor: Color(0xff1A1B27),
             builder: (context){
               return Padding(
                 padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                 child: Container(
                   child: addbottomsheet(
                    controller: currencycontroller(), currency: currency, rate1: index,
                   ),
                 ),
               );
             });
        },
                    child: Column(
                                children: [
                                  ListTile(
            contentPadding: const EdgeInsets.all(16.0),
            leading:const CircleAvatar(backgroundImage: AssetImage("assets/1.png"),radius: 25,backgroundColor: Color(0xff212436),) ,
            title: Text(currency.ratesList[index].currancyName == null
            ?"Loading"
            :"${currency.ratesList[index].currancyName}",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18),),
            trailing: Text(currency.ratesList[index].rate == null
            ?"Loading"
            : "${currency.ratesList[index].rate}",
             style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 15)
           ),
          ),
                                ],
                               ),
                  );
                } 
                ),
             ),
               //  List Diffrent Currency and Calculate
          ]),
        ),
      ),
    );
  }
 

}