import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget{

  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  List<Map<String, String>> events = [
    {
      'title': 'Fitness Workshop',
      'date': '03 January 2024',
      'address':'Bahçelerarası, Mithatpaşa Cd. No:46, 35330 Balçova/İzmir',
      's_details': 'Hep birlikte fit olmaya hazır mısınız!!!!',
      'details':'Bütün üyelerimizi bekleriz.Harika bir etkinlik olması dileğiyle',
      'image': ''


    },
    {
      'title': 'Yoga Day',
      'date': '10 January 2024',
      'address':'Bahçelerarası, Mithatpaşa Cd. No:46, 35330 Balçova/İzmir',
      's_details': 'Yoga becerilerinizi geliştireceğiniz bir workshop.',
      'details':'',
      'image': ''
    },
    {
      'title': 'Kadir Hocayla Edebiyat Söyleşisi',
      'date': '01 January 2024',
      'address':'Bahçelerarası, Mithatpaşa Cd. No:46, 35330 Balçova/İzmir',
      's_details': 'Yılların vücut geliştiricisi Kadir hocayla hasbihal yapacağız. Herkesi bekleriz.',
      'details':'',
      'image': ''
    },
  ];

  @override
  Widget build(BuildContext context) {

  return Scaffold(

    appBar: AppBar(
      title: Text('Monthly Events'),
      backgroundColor: Colors.grey),

    body: ListView.builder(

        itemCount:  events.length,
        itemBuilder:(context, index) {
          final event = events[index];

          return Card(
            margin: EdgeInsets.all(10),
            child: Padding(padding: EdgeInsets.all(10),
            child:Column(
              children: [
                Image.network(event['image'] ?? ''),
                SizedBox(height: 10),
                Text(event['title'] ?? '',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                ),
                SizedBox(height: 5),
                Text(event['date'] ?? '',
                  style: TextStyle(fontSize: 16, color: Colors.black,),
                ),
                SizedBox(height: 5),

                Text(event['s_details'] ?? '', style: TextStyle(color: Colors.indigo,fontSize: 16,),
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

                    child: Text('Event Details', style: TextStyle(color: Colors.teal)),

                  ),
                ),
              ],
            ),
            ),
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
        title: Text(event['title'] ?? 'Event Details'),
      ),
      body: Padding(

        padding: const EdgeInsets.all(18),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            if(event['image']!= null)
            Image.network(event['image']!),
            SizedBox(height: 25),
            if(event['title']!= null)
            Text(event['title']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            SizedBox(height: 8),
            if(event['date']!= null)
            Text(event['date']!,
              style: TextStyle(fontSize: 20, color: Colors.grey),),
            SizedBox(height: 13),
            if(event['address']!= null)
            Text("Location: " + event['address']!,
              style: TextStyle(fontSize: 18, color: Colors.black,fontStyle:FontStyle.italic),),
            SizedBox(height: 22),
            if(event['details']!=null)
            Text(event['details']!,
              style: TextStyle(fontSize: 20),),
          ],

        ),

        ),
      );
  }
}


