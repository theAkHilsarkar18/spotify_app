
import 'package:flutter/foundation.dart';

class Baseprovider extends ChangeNotifier
{
  int navigationIndex = 0;
  void onNavigationTap(int value)
  {
    navigationIndex = value;
    notifyListeners();
  }
}
