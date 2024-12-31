import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});


  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  late Stream<QuerySnapshot> eventsStream;

  @override
  void initState() {
    super.initState();
    eventsStream = FirebaseFirestore.instance.collection('events').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('Monthly Events'), backgroundColor: Colors.blueGrey,),

      body: StreamBuilder<QuerySnapshot>(stream: eventsStream,

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));}
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No events found.'));}
          final events = snapshot.data!.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return {
              'title': data['title'] as String? ?? '',
              'date': data['date'] as String? ?? '',
              'address': data['address'] as String? ?? '',
              's_details': data['s_details'] as String? ?? '',
              'details': data['details'] as String? ?? '',
              'image': data['image'] as String? ?? '',
            };
          }

          ).toList();

          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {

              final event = events[index];

              return Card(

                color: Color.fromRGBO(73, 138, 145, 1.0),
                //color: Color.fromRGBO(215, 229, 238, 1.0),
                margin: EdgeInsets.all(10),

                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black87, Colors.grey,Colors.black38],
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Padding(padding: EdgeInsets.all(10),
                    child:Column(
                      children: [
                        Image.network(event['image'] ?? ''),
                        SizedBox(height: 10),
                        Text(event['title'] ?? '', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                        ),
                        SizedBox(height: 5),
                        Text(event['date'] ?? '', style: TextStyle(fontSize: 16, color: Colors.black,),
                        ),
                        SizedBox(height: 5),

                        Text(event['s_details'] ?? '', style: TextStyle(color: Colors.white,fontSize: 16,),
                        ),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EventDetailsPage(event: event),
                              ),
                            );
                          },

                            child: Text('Event Details', style: TextStyle(color: Colors.yellowAccent)),

                          ),
                        ),

                      ],

                    ),
                  ),
                ),

              );

            },

          );

        },

      ),
    );
  }
}


class EventDetailsPage extends StatelessWidget {
  final Map<String, String> event;
  const EventDetailsPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(event['title'] ?? 'Event Details',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromRGBO(
              199, 219, 225, 1.0)),),

        backgroundColor: Color.fromRGBO(73, 138, 145, 1.0),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.grey,Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              if (event['image'] != null && event['image']!.isNotEmpty)
                Image.network(event['image']!),
              SizedBox(height: 20),

              if (event['title'] != null && event['title']!.isNotEmpty)
                Text(event['title']!,
                  style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
                ),

              SizedBox(height: 8),
              if (event['date'] != null && event['date']!.isNotEmpty)
                Text(event['date']!, style: TextStyle(fontSize: 20, color: Colors.grey),
                ),

              SizedBox(height: 10),
              if (event['address'] != null && event['address']!.isNotEmpty)
                Text("Location: "+ event['address']!,
                  style: TextStyle(fontSize: 18, color: Colors.black, fontStyle: FontStyle.italic,),
                ),

              SizedBox(height: 22),
              if (event['details'] != null && event['details']!.isNotEmpty)

                Text(event['details']!, style: TextStyle(fontSize: 25),
                ),

            ],

          ),

        ),
      ),

    );
  }
}