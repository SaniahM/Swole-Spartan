//This is the class for the dropdown menu but it only has flavour options right now
//So both weight and flavour right now give flavour options


import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  DropDown() : super();
  @override
  DropDownState createState() => DropDownState();
}

class Flavour {
  String flavour;

  Flavour(this.flavour);

  static List<Flavour> getFlavour(){
    return <Flavour>[
      Flavour('Choose an option'),
      Flavour('Chocolate'),
      Flavour('Peanut Butter'),
      Flavour('Strawberry'),
      Flavour('Vanilla'),
    ];
  }
}

class DropDownState extends State<DropDown> {
  List<Flavour> flav = Flavour.getFlavour();
  List<DropdownMenuItem<Flavour>> dropdownMenuItems;
  Flavour selectedFlavour;

  @override
  void initState(){
    dropdownMenuItems = buildDropdownMenuItems(flav);
    selectedFlavour = dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Flavour>> buildDropdownMenuItems(List fls){
    List<DropdownMenuItem<Flavour>> items = List();
    for (Flavour flavour in fls){
      items.add(DropdownMenuItem(
          value: flavour,
          child: Text(flavour.flavour)
      )
      );
    }
    return items;
  }

  onChangeDropdownItem(Flavour selectedFlav){
    setState(() {
      selectedFlavour = selectedFlav;
    });
  }


  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: DropdownButton(
          value: selectedFlavour,
          items: dropdownMenuItems,
          onChanged: onChangeDropdownItem,
        ),
      ),
    );
  }
}
