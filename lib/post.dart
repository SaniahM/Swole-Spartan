import 'package:flutter/material.dart';
import 'spartan_icons_icons.dart';
import 'threads.dart';
import 'DF_home.dart';

class DFPostPage extends StatefulWidget{
  @override
  _DFPostPage createState() => _DFPostPage();
}

class _DFPostPage extends State<DFPostPage>{

  @override
  Widget build(BuildContext context){

    String ssFont = 'NeusaNextStf-CompactRegular.otf';

    List<ThreadClass> threads = [
      ThreadClass('General Discussion', 'Forum Rules',
      'PakGamers is going to kickstart its first Gaming Night! Don’t know what that is? Its simply like an online party, from your home, with your PG friends, A little bit of “ShoorSharaba” with things flying around (monitor, mouse, abuses, calls, etc). Ok?We’re going to record all of the session to put up on your PakGamers Youtube Channel Lets see if this overflows, it most probably will but wel will make this scrollable hopefully.'),
      ThreadClass('Workout Discussion', 'Traps Exercises?', 'Hello'),
      ThreadClass('Supplements Discussion', 'Whey Protein Brands', 'Hello'),
      ThreadClass('Miscellaneous', 'Getting fat',
      'Ramzan is making me fatter'),
    ];

    return Column(
      children: <Widget>[
        Text("Hello"),
      ],
    );
  
  }

}
