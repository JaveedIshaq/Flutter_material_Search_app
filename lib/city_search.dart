import 'package:flutter/material.dart';

class CitySearch extends StatefulWidget {
  @override
  _CitySearchState createState() => _CitySearchState();
}

class _CitySearchState extends State<CitySearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Material Search App"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              })
        ],
      ),
      drawer: Drawer(),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final cities = [
    "Sahiwal",
    "ChichaWatni",
    "Lahore",
    "Multan",
    "Pattoki",
    "Okara",
    "Shah Pur",
    "Sukkar",
    "Hyderabad",
    "Larkana",
    "Kotli",
    "Quetta",
    "Khuzdar",
    "Chaman",
    "Turbat",
    "Sibi",
    "lasbela",
    "Zhob",
    "Gawadar",
    "Nasirabad",
    "Jaffarabad ",
    "Peshawar",
    "Mardan",
    "Mingora",
    "Kohat",
    "AbbotAbad",
    "Bannu",
    "Sawabi",
    "Charsada"
  ];

  final recentCities = [
    "Sibi",
    "lasbela",
    "Zhob",
    "Gawadar",
    "Nasirabad",
  ];

  int selectedCityIndex;

  @override
  List<Widget> buildActions(BuildContext context) {
    //actions for app bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        child: Card(
          color: Colors.indigo,
          elevation: 10.0,
          child: Center(
            child: Text(
              '${cities[selectedCityIndex]}',
              style: TextStyle(fontSize: 22.0, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((p) => p.toLowerCase().contains(query)).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          selectedCityIndex = index;
          showResults(context);
        },
        leading: Icon(Icons.location_city),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style: TextStyle(
                  color: Colors.lightBlueAccent, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
    );
  }
}
