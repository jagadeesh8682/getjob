import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import '../data/providers/api_provider.dart';
import '../data/repositories/job_repository.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiProvider());
    Get.lazyPut(() => JobRepository(apiProvider: Get.find<ApiProvider>()));
    Get.lazyPut(() => ProfileController(repository: Get.find<JobRepository>()));
  }
}
