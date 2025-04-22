import 'package:get/get.dart';
import '../data/models/job_post_model.dart';
import '../data/repositories/job_repository.dart';

class HomeController extends GetxController {
  final JobRepository repository;

  HomeController({required this.repository});

  final RxList<JobPost> allJobPosts = <JobPost>[].obs;

  final RxList<JobPost> jobPosts = <JobPost>[].obs;
  final RxList<JobPost> recommendedJobs = <JobPost>[].obs;
  final RxList<JobPost> suggestedJobs = <JobPost>[].obs;
  final RxList<JobPost> jobAlerts = <JobPost>[].obs;

  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;
  final RxString jobSearchQuery = ''.obs;
  final RxString locationQuery = ''.obs;

  final RxString userName = 'John Wick'.obs;
  final RxString userAvatar = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchJobPosts();
  }

  Future<void> fetchJobPosts() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final fetchedPosts = await repository.getJobPosts();
      allJobPosts.value = fetchedPosts;
      jobPosts.value = fetchedPosts;

      updateJobLists();
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void updateJobLists() {
    if (jobPosts.isEmpty) {
      recommendedJobs.clear();
      suggestedJobs.clear();
      jobAlerts.clear();
    } else {
      recommendedJobs.value = jobPosts.take(3).toList();
      suggestedJobs.value =
          jobPosts.length > 3 ? jobPosts.skip(3).take(3).toList() : [];
      jobAlerts.value =
          jobPosts.length > 6 ? jobPosts.skip(6).take(3).toList() : [];
    }
  }

  void updateJobSearchQuery(String query) {
    jobSearchQuery.value = query;
  }

  void updateLocationQuery(String query) {
    locationQuery.value = query;
  }

  void search() {
    isLoading.value = true;

    if (jobSearchQuery.isEmpty && locationQuery.isEmpty) {
      jobPosts.value = allJobPosts;
    } else {
      jobPosts.value = allJobPosts.where((job) {
        bool matchesJobTitle = true;
        bool matchesLocation = true;

        if (jobSearchQuery.isNotEmpty) {
          matchesJobTitle = job.jobTitle
              .toLowerCase()
              .contains(jobSearchQuery.value.toLowerCase());
        }

        if (locationQuery.isNotEmpty) {
          matchesLocation = job.location
              .toLowerCase()
              .contains(locationQuery.value.toLowerCase());
        }

        return matchesJobTitle && matchesLocation;
      }).toList();
    }

    updateJobLists();

    isLoading.value = false;

    Get.snackbar(
      'Search Results',
      'Found ${jobPosts.length} jobs matching your criteria',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void saveJob(int jobId) {
    Get.snackbar(
      'Job Saved',
      'Job #$jobId has been saved',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void navigateToProfile() {
    Get.toNamed('/profile');
  }

  void clearSearch() {
    jobSearchQuery.value = '';
    locationQuery.value = '';
    jobPosts.value = allJobPosts;
    updateJobLists();
  }
}
