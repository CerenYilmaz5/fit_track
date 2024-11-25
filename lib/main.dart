import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,//Sağ üstteki Debug yazısını kaldırıyor
      title: 'Fit Life',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true, //Uygulamanın güncel kalması için
      ),
      home: const FitnessLoginPage(title: 'Fit Track '),
    );
  }
}

class FitnessLoginPage extends StatefulWidget {
  const FitnessLoginPage({super.key, required this.title});

  final String title;

  @override
  State<FitnessLoginPage> createState() => _FitnessLoginPageState();
}

class _FitnessLoginPageState extends State<FitnessLoginPage> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0) ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(Icons.fitness_center,
                    size: 100,
                    color: Colors.green),
                const SizedBox(height: 20),
                const Text(
                  'Welcome to Fit Track!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height:10),
                const Text(
                  "Stay healhty,stay strong.Let's achieve your goals together!",
                  textAlign: TextAlign.center,
                  style:TextStyle(
                    fontSize:16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height:30),
                TextField(
                    onChanged: (value){
                      setState(() {
                        email=value;
                      });
                    },
                    decoration : InputDecoration(
                        labelText: 'E-Mail',
                        border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        )
                    )

                ),
                const SizedBox(height:30),
                TextField(
                    onChanged: (value){
                      setState(() {
                        password=value;
                      });
                    },
                    decoration : InputDecoration(
                        labelText: 'Password',
                        border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        )
                    )
                ),
                const SizedBox(height: 30,),
                SizedBox(
                  width: double.infinity,
                  child:ElevatedButton(
                    onPressed: (){
                      if(email.isNotEmpty && password.isNotEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Welcome: $email')),
                        );
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text ('Please fill all fields!'))
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 15),// Log in butonunu kalınlaştırıyo
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Log In',style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPasswordPage()),
                        );
                      },
                      child :const Text (
                        'Forgot Password',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    TextButton(
                      onPressed: (){

                      },
                      child :const Text (
                        'Sign Up',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}

//Forgot passaword sayfası
class ForgotPasswordPage extends StatelessWidget{
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context){
    String email = '';

    return  Scaffold(
        appBar: AppBar(
          title: const Text('Forgot Passaword'),
          backgroundColor: Colors.green,
        ),
        body:Padding(
          padding:  const EdgeInsets.all(20),
          child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children : [
              const Text(
                'Enter an email,we send you a link for reset your password.',
                style :TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value){
                  email = value;
                },
                decoration : InputDecoration(
                  labelText: 'E-Mail',
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: (){
                  if(email.isNotEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text (
                            'Link to reset your passaword send $email'),
                      ),
                    );
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter an email')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child : const Text ('Send'),
              ),
            ],
          ),
        )
    );
  }
}

