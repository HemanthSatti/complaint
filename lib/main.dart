import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 190, 211, 225),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'Home Page'),
        '/home': (context) => HomePage(),
        '/complaint': (context) => ComplaintPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove the back arrow
        centerTitle: true, // Center the title
        title: Text(
          'Login',
          style: const TextStyle(
            color: Colors.white, // Set text color to white
            fontWeight: FontWeight.bold, // Make text bold
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(9),
              image: DecorationImage(
                image: const NetworkImage(
                    'https://img.freepik.com/free-vector/navy-blue-geometrical-patterned-mobile-wallpaper-vector_53876-167963.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person ,
                  size: 100, // Adjust icon size as needed
                  color: Colors.black, // Set icon color to black
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your login logic here
                      // For now, just navigate to the home page
                      Navigator.pushNamed(context, '/home');
                    },
                    child: const Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove the back arrow
        title: Text('Select Team'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/complaint');
              },
              child: Text('Operation Team'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/complaint');
              },
              child: Text('Developer Team'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/complaint');
              },
              child: Text('Testing Team'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/complaint');
              },
              child: Text('others'),
            ),
          ],
        ),
      ),
    );
  }
}

class ComplaintPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove the back arrow
        title: Text('Raise a Complaint'),
      ),
      body: Center(
        child: ComplaintForm(),
      ),
    );
  }
}

class ComplaintForm extends StatefulWidget {
  @override
  _ComplaintFormState createState() => _ComplaintFormState();
}

class _ComplaintFormState extends State<ComplaintForm> {
  TextEditingController _complaintController = TextEditingController();
  bool _isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          child: TextField(
            controller: _complaintController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Complaint',
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 250,
          child: ElevatedButton(
            onPressed: () {
              if (_complaintController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('No complaint submitted'),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Your complaint was successfully submitted'),
                  ),
                );
                setState(() {
                  _isSubmitted = true;
                });
                // Navigate back to the login page
                Navigator.pushReplacementNamed(context, '/');
              }
            },
            child: Text(_isSubmitted ? 'Submitted' : 'Submit'),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _complaintController.dispose();
    super.dispose();
  }
}
