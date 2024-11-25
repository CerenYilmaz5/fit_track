import 'package:flutter/material.dart';

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
