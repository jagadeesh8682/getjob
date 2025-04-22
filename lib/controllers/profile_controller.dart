import 'package:get/get.dart';
import '../data/repositories/job_repository.dart';

class ProfileController extends GetxController {
  final JobRepository repository;

  ProfileController({required this.repository});

  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;

  final RxMap<String, dynamic> userProfile = <String, dynamic>{}.obs;
  final RxInt selectedTabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final profile = await repository.getUserProfile();
      userProfile.value = profile;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void setSelectedTab(int index) {
    selectedTabIndex.value = index;
  }

  void editProfile() {
    Get.snackbar(
      'Edit Profile',
      'Edit profile functionality would be implemented here',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void updateResume() {
    Get.snackbar(
      'Update Resume',
      'Update resume functionality would be implemented here',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void attachResume() {
    Get.snackbar(
      'Attach Resume',
      'Attach resume functionality would be implemented here',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void updateSection(String section) {
    Get.snackbar(
      'Update $section',
      'Update $section functionality would be implemented here',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void addNewEmployment() {
    Get.snackbar(
      'Add Employment',
      'Add new employment functionality would be implemented here',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void addNewEducation() {
    Get.snackbar(
      'Add Education',
      'Add new education functionality would be implemented here',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void editSkill() {
    Get.snackbar(
      'Edit Skill',
      'Edit skill functionality would be implemented here',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
