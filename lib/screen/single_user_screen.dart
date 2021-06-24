import 'package:dio/dio.dart';
import 'package:dio_and_json/model/defi.dart';
import 'package:dio_and_json/model/defi_response.dart';
import 'package:dio_and_json/model/single_user_reponse.dart';
import 'package:dio_and_json/model/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../dio_service.dart';

class SingleUserScreen extends StatefulWidget {
  @override
  _SingleUserScreenState createState() => _SingleUserScreenState();
}

class _SingleUserScreenState extends State<SingleUserScreen> {
  DioService dio;

  DefiResponse defiResponse;
  Defi defi;

  bool isLoading = false;

  Future getDefi() async {
    Response response;
    try {
      
      response = await dio.getRequest("/global/decentralized_finance_defi");

      isLoading = false;

      if (response.statusCode == 200) {
        setState(() {
          defiResponse = DefiResponse.fromJson(response.data);
          defi = defiResponse.defi;
        });
      } else {
        print("There is some problem status code not 200");
      }
    } on Exception catch (e) {
      isLoading = false;
      print(e);
    }
  }

  @override
  void initState() {

    dio = DioService();

    getDefi();

    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {

    var defiMarketCap = NumberFormat.simpleCurrency(decimalDigits: 1).format(double.parse('${defi.defiMarketCap}'));
    var defitradingVolume24h =NumberFormat.simpleCurrency(decimalDigits: 1).format(double.parse('${defi.tradingVolume24h}'));

    var defiDominance = double.parse('${defi.defiDominance}').toStringAsFixed(2)+'%';
    var defidefiToEthRatio = double.parse('${defi.defiToEthRatio}').toStringAsFixed(2)+'%';

    var defiTopCoinName = defi.topCoinName;
    var defiTopCoinDefiDomniance = double.parse('${defi.topCoinDefiDomniance}').toStringAsFixed(2)+'%';

   


    
    return Scaffold(
      appBar: AppBar(
        title: Text("DeFi"),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : defi != null ? Container(
        width: double.infinity,
            child: Column(
             
                children: [
                  Card(       
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Image.asset('.../assets/defi.png'),
                ListTile(
                  title: const Text('DeFi'),
                  subtitle: Text(
                    '',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
              ],
            ),

          ),
                  // Text("Hello, ${defi.defiDominance} ${defi.defiMarketCap}"),
                  DataTable(columns: [

                    DataColumn(label: Text("Marketcap")),
                    DataColumn(label: Text("Trading Volume")),

                  ],
                  rows: [
                    DataRow(cells:[

                       DataCell(Text("$defiMarketCap")),
                       DataCell(Text("$defitradingVolume24h")),
                      // DataCell(Text("${defi.defiMarketCap}"))
                    ])
                  ],
                  ),
                  DataTable(columns: [

                    DataColumn(label: Text("Dominance")),
                    DataColumn(label: Text("Defi to Eth Ratio")),

                  ],
                  rows: [
                    DataRow(cells:[

                       DataCell(Text("$defiDominance")),
                       DataCell(Text("$defidefiToEthRatio")),
                      // DataCell(Text("${defi.defiMarketCap}"))
                    ])
                  ],
                  ),
                   DataTable(columns: [

                    DataColumn(label: Text("Top Coin")),
                    DataColumn(label: Text("Coin Dominance")),

                  ],
                  rows: [
                    DataRow(cells:[

                       DataCell(Text("$defiTopCoinName")),
                       DataCell(Text("$defiTopCoinDefiDomniance")),
                      // DataCell(Text("${defi.defiMarketCap}"))
                    ])
                  ],
                  )
                ],
              ),
          ): Center(child : Text("No User Object")),
    );
  }
}
