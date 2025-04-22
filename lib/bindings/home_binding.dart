import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../data/providers/api_provider.dart';
import '../data/repositories/job_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiProvider());
    Get.lazyPut(() => JobRepository(apiProvider: Get.find<ApiProvider>()));
    Get.lazyPut(() => HomeController(repository: Get.find<JobRepository>()));
  }
}
