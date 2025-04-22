import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/profile_controller.dart';
import '../../global_widgets/app_bar.dart';

class ProfileWebView extends GetView<ProfileController> {
  const ProfileWebView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(isWeb: true),
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
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24.0),
                        decoration: const BoxDecoration(
                          color: Color(0xFFE0CDFF),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CircleAvatar(
                                    radius: 36,
                                    backgroundColor: Colors.amber,
                                    child: Text(
                                      'JW',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 16),

                                  // Profile info
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.userProfile['name'] ??
                                            'John Wick Paul II',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '${controller.userProfile['title'] ?? 'Senior Data Base Analyst'} at ${controller.userProfile['company'] ?? 'Orr Appdata Inc'}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),

                                      const SizedBox(height: 16),

                                      // Location
                                      Row(
                                        children: [
                                          const Icon(Icons.location_on,
                                              size: 16),
                                          const SizedBox(width: 4),
                                          Text(
                                            controller
                                                    .userProfile['location'] ??
                                                'Hyattsville, MD, USA',
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 8),

                                      // Experience
                                      Row(
                                        children: [
                                          const Icon(Icons.work, size: 16),
                                          const SizedBox(width: 4),
                                          Text(
                                            controller.userProfile[
                                                    'experience'] ??
                                                '7 Year(s) and 3 Month(s)',
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 8),

                                      // Salary
                                      Row(
                                        children: [
                                          const Icon(Icons.attach_money,
                                              size: 16),
                                          const SizedBox(width: 4),
                                          Text(
                                            controller.userProfile['salary'] ??
                                                'INR 9 Lakh(s) and 75 Thousand(s)',
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // Right section (profile completion and edit button)
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  // Profile completion
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Profile Completion',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        '${controller.userProfile['profileCompletion'] ?? 100}%',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 8),

                                  // Progress bar
                                  LinearProgressIndicator(
                                    value: (controller.userProfile[
                                                'profileCompletion'] ??
                                            100) /
                                        100,
                                    backgroundColor:
                                        Colors.white.withOpacity(0.5),
                                    color: const Color(0xFF486DF5),
                                  ),

                                  const SizedBox(height: 16),

                                  // Edit profile button
                                  ElevatedButton.icon(
                                    onPressed: controller.editProfile,
                                    icon: const Icon(Icons.edit, size: 16),
                                    label: const Text('Edit Profile'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: const Color(0xFF486DF5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Contact info row
                    Row(
                      children: [
                        // Phone numbers
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(Icons.phone,
                                  size: 16, color: Colors.grey),
                              const SizedBox(width: 8),
                              Text(
                                controller.userProfile['phone'] ??
                                    '+1 789 558 65 53 / +1 457 965 78 96',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),

                        // Email
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(Icons.email,
                                  size: 16, color: Colors.grey),
                              const SizedBox(width: 8),
                              Text(
                                controller.userProfile['email'] ??
                                    'johnwickpaulii@gmail.com',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Tab navigation
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey, width: 0.5),
                        ),
                      ),
                      child: Row(
                        children: [
                          _buildTab('Profile', 0),
                          _buildTab('Saved Jobs', 1),
                          _buildTab('Custom Job Alerts', 2),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Tab content
                    Obx(() {
                      switch (controller.selectedTabIndex.value) {
                        case 0:
                          return _buildProfileContent();
                        case 1:
                          return const Center(
                              child: Text('Saved Jobs will appear here'));
                        case 2:
                          return const Center(
                              child:
                                  Text('Custom Job Alerts will appear here'));
                        default:
                          return _buildProfileContent();
                      }
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildTab(String title, int index) {
    return Obx(() {
      final isSelected = controller.selectedTabIndex.value == index;

      return InkWell(
        onTap: () => controller.setSelectedTab(index),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color:
                    isSelected ? const Color(0xFF486DF5) : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? const Color(0xFF486DF5) : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      );
    });
  }

  Widget _buildProfileContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Quick edits sidebar and main content
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left sidebar - Quick edits
            SizedBox(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Quick Edits',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // List of edit options
                  _buildQuickEditOption('Attach Resume'),
                  _buildQuickEditOption('Resume Headline'),
                  _buildQuickEditOption('Key Skills'),
                  _buildQuickEditOption('Employment'),
                  _buildQuickEditOption('Education'),
                  _buildQuickEditOption('IT Skills'),
                  _buildQuickEditOption('Projects'),
                  _buildQuickEditOption('Profile Summary'),
                  _buildQuickEditOption('Accomplishments'),
                  _buildQuickEditOption('Career Profile'),
                  _buildQuickEditOption('Personal Details'),
                ],
              ),
            ),

            const SizedBox(width: 24),

            // Right content - Profile sections
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Resume upload section
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Attach Resume',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Delete Resume',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),

                          Text(
                            'Resume is the most important document recruiters look for. Recruiters generally do not look at profiles without resumes.',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Resume file
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.userProfile['resume'] ??
                                    'Johnwick_Resume.docx',
                                style: const TextStyle(
                                  color: Color(0xFF486DF5),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Updated on ${controller.userProfile['resumeUpdated'] ?? 'Dec 21, 2021'}',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  ElevatedButton(
                                    onPressed: controller.attachResume,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF486DF5),
                                    ),
                                    child: const Text('ATTACH NEW RESUME'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Resume Headline
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Resume Headline',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 16),

                          Text(
                            'Nunc placerat, tellus nec luctus egestas, ipsum lacus scelerisque urna, ac dignissim neque nisi eu nisi. Mauris hendrerit ligula et quam aliquam.',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 14,
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Update button
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () =>
                                  controller.updateSection('Resume Headline'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: const Color(0xFF486DF5),
                                elevation: 0,
                                side:
                                    const BorderSide(color: Color(0xFF486DF5)),
                              ),
                              child: const Text('UPDATE'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Employment
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Employment',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 16),

                          Text(
                            controller.userProfile['employment']['title'] ??
                                'Senior Data Base Analyst',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          Text(
                            controller.userProfile['employment']['company'] ??
                                'Orr Appdata Inc',
                            style: const TextStyle(
                              color: Color(0xFF486DF5),
                              fontSize: 14,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            controller.userProfile['employment']['period'] ??
                                'Jan 2019 to Present (3 years 1 month)',
                            style: TextStyle(
                              color: Colors.orange[700],
                              fontSize: 12,
                            ),
                          ),

                          const SizedBox(height: 12),

                          Text(
                            controller.userProfile['employment']
                                    ['description'] ??
                                'Pellentesque at auctor lectus. Aliquam vulputate maurus vel enim lobortis pharetra. Ut vehicula arcu rhoncus dolor ultricies, auctor ullamcorper nibh tristique. Pellentesque at auctor lectus. Aliquam vulputate maurus vel enim lobortis pharetra. Ut vehicula arcu rhoncus dolor ultricies, auctor ullamcorper nibh tristique.',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 14,
                            ),
                          ),

                          const SizedBox(height: 16),

                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'Projects included in this place',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 14,
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Add new employment button
                          Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit, size: 16),
                                  label: const Text('Edit Job'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: const Color(0xFF486DF5),
                                    elevation: 0,
                                    side: const BorderSide(
                                        color: Color(0xFF486DF5)),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                ElevatedButton(
                                  onPressed: controller.addNewEmployment,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF486DF5),
                                  ),
                                  child: const Text('ADD NEW EMPLOYMENT'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),


                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Education',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 16),

                          Text(
                            controller.userProfile['education']['degree'] ??
                                'Bachelores of Data Science',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          Text(
                            controller.userProfile['education']
                                    ['institution'] ??
                                'MIT Institute of Management',
                            style: const TextStyle(
                              color: Color(0xFF486DF5),
                              fontSize: 14,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            controller.userProfile['education']['year'] ??
                                '2015 (Full time)',
                            style: TextStyle(
                              color: Colors.orange[700],
                              fontSize: 12,
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Edit and Add buttons
                          Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit, size: 16),
                                  label: const Text('Edit'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: const Color(0xFF486DF5),
                                    elevation: 0,
                                    side: const BorderSide(
                                        color: Color(0xFF486DF5)),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                ElevatedButton(
                                  onPressed: controller.addNewEducation,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF486DF5),
                                  ),
                                  child: const Text('ADD NEW EDUCATION'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),


                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'IT Skills',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 16),


                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey[300]!),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Skills',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Version',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Last Used',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Experience',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 40), // For edit button
                              ],
                            ),
                          ),

                          // Skills list
                          ...((controller.userProfile['skills']
                                      as List<dynamic>?) ??
                                  [])
                              .map(
                                (skill) => Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]!),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          skill['name'] ?? '',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          skill['version'] ?? '',
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          skill['lastUsed'] ?? '',
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          skill['experience'] ?? '',
                                        ),
                                      ),
                                      SizedBox(
                                        width: 40,
                                        child: IconButton(
                                          icon: const Icon(Icons.edit,
                                              size: 16,
                                              color: Color(0xFF486DF5)),
                                          onPressed: controller.editSkill,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),

                          const SizedBox(height: 16),

                          // Add button
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF486DF5),
                              ),
                              child: const Text('ADD NEW SKILL'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickEditOption(String title) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF486DF5),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
