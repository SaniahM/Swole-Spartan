import 'package:flutter/material.dart';
import 'login.dart';
import 'generic.dart';
import 'package:provider/provider.dart';
import 'user.dart';

class Gateway extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
     
    final user = Provider.of<User>(context);
    
    if (user==null){ 
      return LoginPage();
    }
    else{
      return GenericTemplate();
    }

  }
}