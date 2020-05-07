import 'package:SwoleSpartan/searchresults.dart';
import 'package:flutter/material.dart';


class SearchBarPage extends SearchDelegate<String> {

  final cities = [
    "Hello",
    "Sample",
    "Test",
  ];

  final recentCities = [
    "test",
    "one",
    "two",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    //Actions for AppBar
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () {
        query = "";
      })
    ]; 
  }
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation
        ),
    onPressed: () {
      close(context, null);
    });
    //Leading icons on the left of the AppBar
  }

  @override
  Widget buildResults(BuildContext context) {
    //Results
    return querylist(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = List<String>();

    return ListView.builder(itemBuilder: (context, index) => ListTile(
      leading: Icon(Icons.arrow_right),
      title: Text(suggestionList[index]),
    ),
    itemCount: suggestionList.length,
    );
  }

}
