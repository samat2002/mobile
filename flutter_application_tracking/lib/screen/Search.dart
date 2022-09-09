import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String? country;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Covid Report"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(hintText: "Input country"),
            onChanged: (value) {
              country = value;
            },
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context, country);
              },
              child: const Text("Search"))
        ],
      ),
    );
  }
}
