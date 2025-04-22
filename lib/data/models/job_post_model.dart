class JobPost {
  final int userId;
  final int id;
  final String title;
  final String body;

  // Additional properties for UI
  String companyName = 'Ora Apps Inc';
  String location = 'Remote or Hyattsville, MD, USA';
  String salary = 'Not Disclosed';
  String experience = '2 to 8 yrs';
  String jobTitle = 'US IT Technical Recruiter';
  String logoUrl = '';

  JobPost({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  }) {
    // Mock data since API doesn't provide these fields
    if (id % 3 == 0) {
      companyName = 'Tech Solutions Inc';
      jobTitle = 'Senior Software Engineer';
    } else if (id % 3 == 1) {
      companyName = 'Ora Apps Inc';
      jobTitle = 'US IT Technical Recruiter';
    } else {
      companyName = 'DataViz Analytics';
      jobTitle = 'Data Scientist';
    }
  }

  factory JobPost.fromJson(Map<String, dynamic> json) {
    return JobPost(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  // Mock user data for UI
  static Map<String, dynamic> userProfile = {
    'name': 'John Wick Paul II',
    'title': 'Senior Data Base Analyst',
    'company': 'Ora Appdata Inc',
    'location': 'Hyattsville, MD, USA',
    'experience': '7 Year(s) and 3 Month(s)',
    'salary': 'INR 9 Lakh(s) and 75 Thousand(s)',
    'profileCompletion': 100,
    'email': 'johnwickpaulii@gmail.com',
    'phone': '+1 789 558 65 53 / +1 457 965 78 96',
    'resume': 'Johnwick_Resume.docx',
    'resumeUpdated': 'Dec 21, 2021',
    'education': {
      'degree': 'Bachelores of Data Science',
      'institution': 'MIT Institute of Management',
      'year': '2015 (Full time)'
    },
    'employment': {
      'title': 'Senior Data Base Analyst',
      'company': 'Orr Appdata Inc',
      'period': 'Jan 2019 to Present (3 years 1 month)',
      'description':
          'Pellentesque at auctor lectus. Aliquam vulputate maurus vel enim lobortis pharetra. Ut vehicula arcu rhoncus dolor ultricies, auctor ullamcorper nibh tristique. Pellentesque at auctor lectus. Aliquam vulputate maurus vel enim lobortis pharetra. Ut vehicula arcu rhoncus dolor ultricies, auctor ullamcorper nibh tristique.'
    },
    'skills': [
      {
        'name': 'Data Analysis',
        'version': 'Latest',
        'lastUsed': '2022',
        'experience': '3 Years'
      },
      {
        'name': 'Data Science',
        'version': 'Latest',
        'lastUsed': '2022',
        'experience': '6 Years'
      }
    ]
  };
}
