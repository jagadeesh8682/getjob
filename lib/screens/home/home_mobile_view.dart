// lib/app/ui/home/views/home_mobile_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/home_controller.dart';
import '../../global_widgets/app_bar.dart';
import 'widgets/job_card.dart';

class HomeMobileView extends GetView<HomeController> {
  const HomeMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.value.isNotEmpty) {
          return Center(
            child: Text(
              'Error: ${controller.errorMessage.value}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextField(
                          decoration: const InputDecoration(
                            hintText: 'User Experience Designer',
                            prefixIcon: Icon(Icons.search),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                          ),
                          onChanged: controller.updateJobSearchQuery,
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          decoration: const InputDecoration(
                            hintText: 'Hyattsville',
                            prefixIcon: Icon(Icons.location_on),
                            suffixIcon: Icon(Icons.my_location),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                          ),
                          onChanged: controller.updateLocationQuery,
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: controller.search,
                            child: const Text(
                              'Search',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Text(
                  'Recommended Jobs',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ...controller.recommendedJobs
                    .map(
                      (job) => JobCard(
                        job: job,
                        onSave: () => controller.saveJob(job.id),
                      ),
                    )
                    .toList(),
                const SizedBox(height: 24),
                const Text(
                  'Suggested Jobs',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ...controller.suggestedJobs
                    .map(
                      (job) => JobCard(
                        job: job,
                        onSave: () => controller.saveJob(job.id),
                      ),
                    )
                    .toList(),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Job Alerts',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'MANAGE ALERTS',
                        style: TextStyle(
                          color: Color(0xFF486DF5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ...controller.jobAlerts
                    .map(
                      (job) => JobCard(
                        job: job,
                        onSave: () => controller.saveJob(job.id),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
