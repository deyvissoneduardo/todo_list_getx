import 'package:get/get.dart';

import '../pages/add_tasks.dart';
import '../pages/home_page.dart';

class Routes {
  static const HOMEPAGE = '/home_page';
  static const TASKPAGE = '/add_tasks';

  static List<GetPage> get pages => [
        GetPage(name: HOMEPAGE, page: () => const HomePage()),
        GetPage(name: TASKPAGE, page: () => const AddTasksScreen()),
      ];
}
