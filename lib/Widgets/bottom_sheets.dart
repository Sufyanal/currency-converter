import 'package:flutter/material.dart';
import '../Modals/Currency_rat.dart';
import '../controller/cont.dart';

class addbottomsheet extends StatefulWidget {
   addbottomsheet({super.key,required this.controller,required this.currency,required this.rate1});
   final currencycontroller  controller;

   final CurrencyRate currency;
   int rate1;
   

  @override
  State<addbottomsheet> createState() => _addbottomsheetState();
}

class _addbottomsheetState extends State<addbottomsheet> {
  CurrencyRate time = CurrencyRate();

  TextEditingController converTextField = TextEditingController();
  TextEditingController multiplyTextField = TextEditingController();

  double? doublevalue;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Image.asset("assets/1.png",height: 100,),
              Padding(
                padding: const EdgeInsets.all(30.0),
                
                  child: TextField(
                    controller: converTextField,
                    onChanged: (value){
                      doublevalue=converTextField.text.isEmpty
                      ?0
                      : double.parse(converTextField.text)*double.parse(
                        widget.currency.ratesList[widget.rate1].rate
                        .toString() );
                        setState(() {
                          multiplyTextField.text = doublevalue.toString();
                        });
                    },


                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                    keyboardType: TextInputType.number,
                    
                    decoration: textdecoration("${widget.currency.ratesList[0].currancyName}")
                  ),
                  
                
              ),
                Padding(
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: TextField(
                  readOnly: true,
                  controller: multiplyTextField,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                    keyboardType: TextInputType.number,
                    decoration: textdecoration("${widget.currency.ratesList[widget.rate1].currancyName}") 
                 
                  ),
              )
              ],
            ),
    );
      
  }

  InputDecoration textdecoration(Textsuffix){
    return InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 20,top: 10),
                  child: Text("${Textsuffix}",style: Theme.of(context).textTheme.bodyMedium,),
                ),
                        fillColor: Color(0xff212436),
                        filled: true,
                  focusColor: null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                    );
  }
}