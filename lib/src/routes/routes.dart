import 'package:get/get.dart';

import '../modules/home/home_page.dart';
import '../modules/tasks/add_tasks.dart';

class Routes {
  static const HOMEPAGE = '/home_page';
  static const TASKPAGE = '/add_tasks';

  static List<GetPage> get pages => [
        GetPage(name: HOMEPAGE, page: () => const HomePage()),
        GetPage(name: TASKPAGE, page: () => const AddTasksScreen()),
      ];
}
