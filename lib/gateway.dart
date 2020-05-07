import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'generic.dart';
import 'login.dart';
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