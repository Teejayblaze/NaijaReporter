import 'package:flutter/material.dart';

class NaijaReportersAppProvider extends InheritedWidget {

  const NaijaReportersAppProvider({
    Key key,
    @required Widget child,
  })
      : assert(child != null),
        super(key: key, child: child);

  static NaijaReportersAppProvider of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(
        NaijaReportersAppProvider) as NaijaReportersAppProvider;
  }

  @override
  bool updateShouldNotify(NaijaReportersAppProvider old) => false;
}