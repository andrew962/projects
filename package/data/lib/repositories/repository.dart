import 'package:data/network/network.dart';
import 'package:get_it/get_it.dart';

abstract class Repository {
  Network network = GetIt.instance<Network>();
}
