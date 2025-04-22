import '../models/job_post_model.dart';
import '../providers/api_provider.dart';

class JobRepository {
  final ApiProvider apiProvider;

  JobRepository({required this.apiProvider});

  Future<List<JobPost>> getJobPosts() async {
    return await apiProvider.getJobPosts();
  }

  Future<JobPost> getJobPostById(int id) async {
    return await apiProvider.getJobPostById(id);
  }

  // Mock function to get user profile
  Future<Map<String, dynamic>> getUserProfile() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return JobPost.userProfile;
  }
}
