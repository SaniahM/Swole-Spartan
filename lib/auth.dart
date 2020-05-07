import 'package:firebase_auth/firebase_auth.dart';

import 'user.dart';

//User authentication services.
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create [user] object.
  User _user(FirebaseUser user) {
    return user != null ? User(uid: user.uid, status: user.isAnonymous) : null;
  }

  //Divert user stream.
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_user);
  }

  //guest sign-in
  Future guestSignIn() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _user(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Official signup.
  Future signUp(String email, String password, String fName, String lName,
      String address, String phone) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      await DatabaseService(uid: user.uid)
          .updateUserData(fName, lName, address, phone, email);

      return _user(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //login.
  Future logIn(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _user(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//Logout.
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

bool anAlphabet(String x) {
  List small = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z'
  ];
  List caps = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

  for (int i = 0; i < 26; i++) {
    if (x == small[i]) {
      return true;
    }
  }

  for (int i = 0; i < 26; i++) {
    if (x == caps[i]) {
      return true;
    }
  }

  return false;
}

bool aNumber(String x) {
  List numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

  for (int i = 0; i < 10; i++) {
    if (x == numbers[i]) {
      return true;
    }
  }

  return false;
}

bool aSymbol(String x) {
  List symbols = ['\$', '@', '#', '&', '!'];

  for (int i = 0; i < symbols.length; i++) {
    if (x == symbols[i]) {
      return true;
    }
  }

  return false;
}

bool anEmailSymbol(String x) {
  List symbols = ['.', '_', '-'];

  for (int i = 0; i < symbols.length; i++) {
    if (x == symbols[i]) {
      return true;
    }
  }

  return false;
}

List validateNewPassword(String password) {
  bool alphabetFlag = false;
  bool numberFlag = false;

  bool invalidInputFlag = false;

  for (int i = 0; i < password.length; i++) {
    if (anAlphabet(password[i])) {
      alphabetFlag = true;
    } else if (aNumber(password[i])) {
      numberFlag = true;
    } else if (aSymbol(password[i])) {
    } else {
      invalidInputFlag = true;
      break;
    }
  }

  return [alphabetFlag, numberFlag, invalidInputFlag];
}

bool validateNewEmail(String address) {
  //first letter must be a letter or a number
  if (!(aNumber(address[0]) || anAlphabet(address[0]))) {
    return false;
  }

  int divider1 = -1;
  int divider2 = -1;

  for (int i = 0; i < address.length; i++) {
    if (address[i] == '@' && divider1 != -1) {
      return false;
    } else if (address[i] == '@') {
      divider1 = i;
    }

    if (address[i] == '.' && divider1 != -1) {
      divider2 = i;
    }
  }

  // Missing '@' or '.'
  if (divider1 == -1 || divider2 == -1) {
    return false;
  }

  // The last portion of the domain must be at least two characters, for example: .com, .org, .cc
  if ((address.length - divider2) < 3) {
    return false;
  }

  // Rules for prefix: Allowed characters: letters (a-z), numbers, underscores, periods, and dashes
  // An underscore, period, or dash must be followed by one or more letter or number.

  for (int i = 0; i < divider1; i++) {
    if (anAlphabet(address[i]) || aNumber(address[i])) {
    } else if (anEmailSymbol(address[i]) && i != divider1 - 1) {
      if (anAlphabet(address[i + 1]) || aNumber(address[i + 1])) {
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  // Domain Allowed characters: letters, numbers, dashes.

  // A dash must be followed by a letter or a number
  // A dot must be preceded and followed by a letter or a number
  // All subdomains must be at least 2 characters long

  for (int i = divider1 + 1; i < address.length; i++) {
    if (anAlphabet(address[i]) || aNumber(address[i])) {
    } else if (address[i] == '-' && i != address.length - 1) {
      if (anAlphabet(address[i + 1]) || aNumber(address[i + 1])) {
      } else {
        return false;
      }
    } else if (address[i] == '.' && i <= address.length - 3) {
      if (anAlphabet(address[i + 1]) || aNumber(address[i + 1])) {
      } else {
        return false;
      }
      if (anAlphabet(address[i + 2]) || aNumber(address[i + 2])) {
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  return true;
}
