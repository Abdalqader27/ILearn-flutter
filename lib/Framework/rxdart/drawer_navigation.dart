import 'package:ilearn/Helper/Widgets/custom_drawer/home_drawer.dart';
import 'package:rxdart/rxdart.dart';

class DrawerNavigation {
  final _drawerNavigation= BehaviorSubject<DrawerIndex>.seeded(DrawerIndex.HOME);

  Stream<DrawerIndex> get observableObject => _drawerNavigation.stream;

  Function(DrawerIndex) get changeObject => _drawerNavigation.sink.add;

  dispose() => _drawerNavigation.close();
}

