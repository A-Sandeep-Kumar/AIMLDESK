import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(DietStudentApp());
}
class DietStudentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diet CSE-AI&ML',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF1565C0),
        hintColor: Color(0xFF00BCD4),
        fontFamily: 'Roboto',
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1565C0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.school,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'DIET COLLEGE',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'CSE - AI & ML Department',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 40),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    Dashboard(),
    TimeTable(),
    Subjects(),
    Resources(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diet CSE-AI&ML'),
        backgroundColor: Color(0xFF1565C0),
        elevation: 0,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF1565C0),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'Timetable'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Subjects'),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'Resources'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1565C0), Color(0xFF00BCD4)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'CSE - AI & ML Department',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                SizedBox(height: 8),
                Text(
                  'Current Semester: 5th',
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Quick Access',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 1.2,
            children: [
              _buildQuickAccessCard(
                'Attendance',
                Icons.check_circle,
                Colors.green,
                '85%',
              ),
              _buildQuickAccessCard(
                'Assignments',
                Icons.assignment,
                Colors.orange,
                '6 Pending',
              ),
              _buildQuickAccessCard(
                'GPA',
                Icons.grade,
                Colors.purple,
                '8.5',
              ),
              _buildQuickAccessCard(
                'Notifications',
                Icons.notifications,
                Colors.red,
                '5 New',
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Recent Updates',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          _buildUpdateCard(
            'New Assignment: Machine Learning Project',
            'Due: 25th august 2025',
            Icons.assignment_turned_in,
          ),
          _buildUpdateCard(
            'Exam Schedule Updated',
            'Check your timetable for changes',
            Icons.schedule,
          ),
          _buildUpdateCard(
            'AI Workshop Registration Open',
            'Register before 20th July',
            Icons.event,
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAccessCard(String title, IconData icon, Color color, String value) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(fontSize: 18, color: color, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpdateCard(String title, String subtitle, IconData icon) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(0xFF1565C0),
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}

class TimeTable extends StatelessWidget {
  final List<Map<String, dynamic>> schedule = [
    {
      'day': 'Monday',
      'classes': [
        {'time': '09:00 - 9:50', 'subject': 'CC'},
        {'time': '9:50 - 10:40', 'subject': 'RES'},
        {'time': '10:50 - 11:30', 'subject': 'TECH'},
        {'time': '11:30 - 12:20', 'subject': 'OS'},
        {'time': '12:20 - 1:10', 'subject': 'IRS'},
        {'time': '2:00 - 2:50', 'subject': 'CN'},
        {'time': '2:50 - 3:40', 'subject': 'OS'},
        {'time': '3:40 - 4:30', 'subject': 'SPORTS'},
      ],
    },
    {
      'day': 'TUESDAY',
      'classes': [
        {'time': '09:00 - 9:50', 'subject': 'CC'},
        {'time': '9:50 - 10:40', 'subject': 'CN'},
        {'time': '10:50 - 11:30', 'subject': 'COUN'},
        {'time': '11:30 - 12:20', 'subject': 'OS'},
        {'time': '12:20 - 1:10', 'subject': 'RES'},
        {'time': '2:00 - 2:50', 'subject': 'CN'},
        {'time': '2:50 - 3:40', 'subject': 'CC'},
        {'time': '3:40 - 4:30', 'subject': 'IRS'},
      ],
    },
     {
      'day': 'WEDNESDAY',
      'classes': [
        {'time': '09:00 - 9:50', 'subject': 'IRS'},
        {'time': '9:50 - 10:40', 'subject': 'OS'},
        {'time': '10:50 - 11:30', 'subject': 'RES'},
        {'time': '11:30 - 12:20', 'subject': 'APT'},
        {'time': '12:20 - 1:10', 'subject': 'APT'},
        {'time': '2:00 - 2:50', 'subject': 'CN LAB'},
        {'time': '2:50 - 3:40', 'subject': 'CN LAB'},
        {'time': '3:40 - 4:30', 'subject': 'CN LAB'},
      ],
    },
     {
      'day': 'THURSDAY',
      'classes': [
        {'time': '09:00 - 9:50', 'subject': 'OS'},
        {'time': '9:50 - 10:40', 'subject': 'FSD LAB'},
        {'time': '10:50 - 11:30', 'subject': 'FSD LAB'},
        {'time': '11:30 - 12:20', 'subject': 'FSD LAB'},
        {'time': '12:20 - 1:10', 'subject': 'FSD LAB'},
        {'time': '2:00 - 2:50', 'subject': 'CC'},
        {'time': '2:50 - 3:40', 'subject': 'RES'},
        {'time': '3:40 - 4:30', 'subject': 'CN'},
      ],
    },
     {
      'day': 'FRIDAY',
      'classes': [
        {'time': '09:00 - 9:50', 'subject': 'CN'},
        {'time': '9:50 - 10:40', 'subject': 'CC'},
        {'time': '10:50 - 11:30', 'subject': 'IRS'},
        {'time': '11:30 - 12:20', 'subject': 'CN'},
        {'time': '12:20 - 1:10', 'subject': 'TECH'},
        {'time': '2:00 - 2:50', 'subject': 'IRS LAB'},
        {'time': '2:50 - 3:40', 'subject': 'IRS LAB'},
        {'time': '3:40 - 4:30', 'subject': 'IRS LAB'},
      ],
    },
     {
      'day': 'SATURDAY',
      'classes': [
        {'time': '09:00 - 9:50', 'subject': 'CC'},
        {'time': '9:50 - 10:40', 'subject': 'RES'},
        {'time': '10:50 - 11:30', 'subject': 'IRS'},
        {'time': '11:30 - 12:20', 'subject': 'OS'},
        {'time': '12:20 - 1:10', 'subject': 'LIB'},
        {'time': '2:00 - 2:50', 'subject': 'IRS'},
        {'time': '2:50 - 3:40', 'subject': 'FLUTTER LAB'},
        {'time': '3:40 - 4:30', 'subject': 'FLUTTER LAB'},
      ],
    }, // Add more days as needed
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weekly Timetable',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ...schedule.map((day) => _buildDaySchedule(day)).toList(),
        ],
      ),
    );
  }

  Widget _buildDaySchedule(Map<String, dynamic> day) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Color(0xFF1565C0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
            child: Text(
              day['day'],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          ...day['classes'].map<Widget>((cls) => _buildClassItem(cls)).toList(),
        ],
      ),
    );
  }

  Widget _buildClassItem(Map<String, String> cls) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Color(0xFF00BCD4).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              cls['time']!,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00BCD4),
              ),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cls['subject']!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Subjects extends StatelessWidget {
  final List<Map<String, dynamic>> subjects = [
    {
      'name': 'IRS',
       'code': 'CSM402',
      'credits': 4,
      'instructor': 'Dr. Suresh Babu Ch',
    },
    {
      'name': 'CN',
       'code': 'CSM403',
      'credits': 4,
      'instructor': 'Mr.Md.Eliaz ',
    },
    {
      'name': 'OS',
      'code': 'CSM404',
      'credits': 3,
      'instructor': 'Mrs P.Mareswaramma',
    },
    {
      'name': 'CC',
       'code': 'CSM405',
      'credits': 3,
      'instructor': 'Dr A.Sudhakar',
    },
    {
      'name': 'RES',
       'code': 'CSM406',
      'credits': 3,
      'instructor': 'Mr N.E.K.Chandra',
    },
    {
      'name': 'IRS LAB',
       'code': 'CSM407',
      'credits': 4,
      'instructor': 'Dr. Suresh Babu Ch',
    },
    {
      'name': 'CN LAB',
       'code': 'CSM408',
      'credits': 4,
      'instructor': 'Mr.Md.Eliaz ',
    },
    {
      'name': 'FSD LAB',
       'code': 'CSM409',
      'credits': 4,
      'instructor': 'Mr.R.Madhukanth',
    },
    {
      'name': 'FLUTTER LAB',
       'code': 'CSM410',
      'credits': 4,
      'instructor': 'Mrs.E.Narmadha',
    },
    {
      'name': 'TECH',
       'code': 'CSM411',
      'credits': 0,
      'instructor': 'Mrs.M.Jyothi',
    },
    {
      'name': 'APT',
       'code': 'CSM412',
      'credits': 0,
      'instructor': 'Mrs.P.Pavani',
    },
    {
      'name': 'SPORTS',
       'code': 'CSM413',
      'credits': 0,
      'instructor': 'Mrs P.Mareswaramma',
    },
    {
      'name': 'LIB',
       'code': 'CSM414',
      'credits': 0,
      'instructor': 'Mrs P.Mareswaramma',
    },
    {
      'name': 'COUN',
       'code': 'CSM415',
      'credits': 0,
      'instructor': 'Mr.Md.Eliaz' 'Mr.R.Madhukanth',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current Subjects',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ...subjects.map((subject) => _buildSubjectCard(subject)).toList(),
        ],
      ),
    );
  }

  Widget _buildSubjectCard(Map<String, dynamic> subject) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subject['name'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '${subject['code']} • ${subject['credits']} Credits',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Instructor: ${subject['instructor']}',
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            SizedBox(height: 15),
            Text(
              'Progress',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: subject['progress'],
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1565C0)),
            ),
          ],
        ),
      ),
    );
  }
}

class Resources extends StatelessWidget {
  final List<Map<String, dynamic>> resources = [
    {
      'category': 'Study Materials',
      'items': [
        {'name': 'ML Lecture Notes', 'type': 'PDF', 'icon': Icons.picture_as_pdf},
        {'name': 'DL Slides', 'type': 'PPT', 'icon': Icons.slideshow},
        {'name': 'Python Cheatsheet', 'type': 'PDF', 'icon': Icons.code},
      ],
    },
    {
      'category': 'Assignments',
      'items': [
        {'name': 'ML Project Guidelines', 'type': 'DOC', 'icon': Icons.assignment},
        {'name': 'CV Assignment 2', 'type': 'PDF', 'icon': Icons.camera_alt},
        {'name': 'NLP Lab Tasks', 'type': 'ZIP', 'icon': Icons.folder_zip},
      ],
    },
    {
      'category': 'Reference Books',
      'items': [
        {'name': 'Pattern Recognition - Bishop', 'type': 'PDF', 'icon': Icons.book},
        {'name': 'Deep Learning - Goodfellow', 'type': 'PDF', 'icon': Icons.book},
        {'name': 'AI Modern Approach - Russell', 'type': 'PDF', 'icon': Icons.book},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Resources',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ...resources.map((category) => _buildResourceCategory(category)).toList(),
        ],
      ),
    );
  }

  Widget _buildResourceCategory(Map<String, dynamic> category) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Color(0xFF1565C0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
            child: Text(
              category['category'],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          ...category['items'].map<Widget>((item) => _buildResourceItem(item)).toList(),
        ],
      ),
    );
  }

  Widget _buildResourceItem(Map<String, dynamic> item) {
    return ListTile(
      leading: Icon(item['icon'], color: Color(0xFF1565C0)),
      title: Text(item['name']),
      subtitle: Text(item['type']),
      trailing: Icon(Icons.download, color: Colors.grey),
      onTap: () {
        // Handle download or view action
      },
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xFF1565C0),
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                SizedBox(height: 15),
                Text(
                  'A.SANDEEP KUMAR',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Roll No: 238T1A4204',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: Color(0xFF1565C0).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'CSE - AI & ML',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF1565C0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          _buildProfileSection('Academic Info', [
            {'label': 'Current Semester', 'value': '5th Semester'},
            {'label': 'Current CGPA', 'value': '8.14'},
            {'label': 'Batch', 'value': '2023-2027'},
            {'label': 'Section', 'value': 'A'},
          ]),
          _buildProfileSection('Personal Info', [
            {'label': 'Email', 'value': '238T1A4204@diet.ac.in'},
            {'label': 'Phone', 'value': '+91 7993954967'},
            {'label': 'Address', 'value': 'vuyyuru,Ap'},
            {'label': 'Date of Birth', 'value': '01/01/2005'},
          ]),
          SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              // Handle logout
            },
            icon: Icon(Icons.logout),
            label: Text('Logout'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              minimumSize: Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection(String title, List<Map<String, String>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15),
        Card(
          elevation: 3,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: items.map((item) => _buildInfoRow(item['label']!, item['value']!)).toList(),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text(': '),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}