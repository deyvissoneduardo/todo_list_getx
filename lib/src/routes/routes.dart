import 'package:get/get.dart';

import '../pages/home_page.dart';

class Routes {
  static List<GetPage> get pages => [
        GetPage(name: '/home_page', page: () => const HomePage()),
      ];
}
