import 'package:example/routing/routes.dart';
import 'package:get/get.dart';

// This is the routes list that is passed to getPages in GetMaterialApp
abstract final class GetRoutes {
  static List<GetPage> get getRoutingTable {
    final entries = Routes.routingTable.entries;

    return entries.map((entry) {
      return GetPage(name: entry.key, page: () => entry.value(Get.context!));
    }).toList();
  }
}
