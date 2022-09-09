import 'package:flutter/material.dart';
import 'package:flutter_application_tracking/Api.dart';
import 'package:flutter_application_tracking/constant.dart';
import 'package:flutter_application_tracking/coviddata/covid_data.dart';
import 'package:flutter_application_tracking/screen/Search.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<CovidData> coviddata;

  @override
  void initState() {
    coviddata = GetApi.GetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // String? country;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.blue[300]),
                child: FutureBuilder(
                  future: coviddata,
                  builder: (context, AsyncSnapshot snapshot) {
                    List<Widget> childs = [];
                    if (snapshot.hasData) {
                      childs.add(Column(
                        children: [
                          const Icon(
                            Icons.coronavirus,
                            size: 120,
                          ),
                          Text(
                              "country : ${snapshot.data!.countryText.toString()}",
                              style: textst),
                          Text(
                              "totalCases : ${snapshot.data!.totalCasesText.toString()}",
                              style: textst),
                          Text(
                              "totalDeaths : ${snapshot.data!.totalDeathsText.toString()}",
                              style: textst),
                          Text(
                              "totalRecovered : ${snapshot.data!.totalRecoveredText.toString()}",
                              style: textst),
                        ],
                      ));
                    } else {
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(),
                          ],
                        ),
                      );
                    }
                    return Column(
                      children: childs,
                    );
                  },
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () async {
                        var country = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Search()));
                        if (country != null) {
                          coviddata = GetApi.GetDataFromCountry(name: country);
                          setState(() {});
                        }
                      },
                      child: const Text("Search")),
                ],
              )
            ],
          ),
        ));
  }
}
