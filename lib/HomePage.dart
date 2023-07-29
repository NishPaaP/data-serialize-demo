import 'package:api_modelling/data_fatcher.dart';
import 'package:api_modelling/modelClass.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Demo? _demo = Demo();

 fetchTripDetails() async {
    DataFatcher _dataFetcher = DataFatcher();
    var _dataa = await _dataFetcher.fetch_ApprovedTripDetails();
    setState(() {
      _demo = _dataa;
    });
  }

@override
  void initState() {
    fetchTripDetails();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: Container(
        child: Column(
          children: [
            Text("First Name : ${_demo!.firstName}")
          ],
        ),
      ),
    );
  }
}