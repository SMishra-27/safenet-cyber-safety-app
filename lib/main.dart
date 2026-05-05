import 'package:flutter/material.dart';

void main() {
  runApp(DigitalArrestApp());
}

class DigitalArrestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeNet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/what': (context) => WhatIsDigitalArrest(),
        '/tips': (context) => PreventiveTipsScreen(),
        '/report': (context) => ReportScamScreen(),
        '/helpline': (context) => HelplineScreen(),
        '/strategies': (context) => PreventionStrategiesScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black.withOpacity(0.5)),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                ),
                SizedBox(height: 10),
                Text(
                  'SafeNet',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Protect Yourself from Digital Arrest Scams',
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/what'),
                  child: Text('What is Digital Arrest?'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/tips'),
                  child: Text('Preventive Tips'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/strategies'),
                  child: Text('Prevention Strategies'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/helpline'),
                  child: Text('Cybercrime Helpline Numbers'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/report'),
                  child: Text('Report a Scam'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WhatIsDigitalArrest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('What is Digital Arrest?')),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Image.asset('assets/images/arrest.png'),
          SizedBox(height: 20),
          Text(
            'Digital Arrest is a scam where fake officials threaten innocent people with fake legal charges.\n\nThey often ask for money or personal info to "settle" the case.\n\nStay alert and report such incidents.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class PreventiveTipsScreen extends StatelessWidget {
  final List<String> tips = [
    'Never share OTPs or passwords.',
    'Verify identity of callers.',
    'Government agencies never ask for money over calls.',
    'Call 1930 to report cyber fraud in India.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Preventive Tips')),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Image.asset('assets/images/safety.png'),
          SizedBox(height: 20),
          ...tips.map((tip) => Card(
                color: Colors.deepPurple[50],
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  leading: Icon(Icons.shield, color: Colors.deepPurple),
                  title: Text(tip),
                ),
              )),
        ],
      ),
    );
  }
}

class ReportScamScreen extends StatelessWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Report a Scam')),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Image.asset('assets/images/report.png'),
          SizedBox(height: 20),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Describe the scam incident',
              border: OutlineInputBorder(),
            ),
            maxLines: 5,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Report submitted! Stay safe.')),
              );
              _controller.clear();
            },
            child: Text('Submit'),
          )
        ],
      ),
    );
  }
}

class HelplineScreen extends StatelessWidget {
  final List<String> helplines = [
    '📞 Cybercrime Helpline (India): 1930',
    '🌐 Report online: cybercrime.gov.in',
    '📱 Local Police Station (nearest branch)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cybercrime Helpline Numbers')),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Image.asset('assets/images/helpline.png'),
          SizedBox(height: 20),
          ...helplines.map((line) => Card(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  leading: Icon(Icons.phone, color: Colors.green),
                  title: Text(line),
                ),
              )),
        ],
      ),
    );
  }
}

class PreventionStrategiesScreen extends StatelessWidget {
  final List<String> strategies = [
    '🔐 Use strong, unique passwords for each account.',
    '📵 Do not respond to unsolicited calls asking for personal info.',
    '💻 Install antivirus software and keep it updated.',
    '📧 Avoid clicking on unknown links or attachments.',
    '📱 Enable two-factor authentication on accounts.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Prevention Strategies')),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Image.asset('assets/images/secure.png'),
          SizedBox(height: 20),
          ...strategies.map((tip) => Card(
                color: Colors.green[50],
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  leading:
                      Icon(Icons.check_circle_outline, color: Colors.green),
                  title: Text(tip),
                ),
              )),
        ],
      ),
    );
  }
}
