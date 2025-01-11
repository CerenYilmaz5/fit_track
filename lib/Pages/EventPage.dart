import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_track/Pages/FitnessLoginPage.dart';
import 'package:fit_track/Pages/StatsPlanningPage.dart';
import 'package:fit_track/Pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  late Stream<QuerySnapshot> eventsStream;
  int selected_index = 0;

  @override
  void initState() {
    super.initState();
    eventsStream = FirebaseFirestore.instance.collection('events').snapshots();
  }

  void handleLogout(BuildContext context) async {
    final firebaseAuth = FirebaseAuth.instance;

    try {
      await firebaseAuth.signOut();

      // Navigate after successful logout
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => FitnessLoginPage(title: 'Fit Track Login'),
          ),
        );
      }
    } catch (e) {
      // Handle errors (e.g., show a snackbar)
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to log out: ${e.toString()}')),
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Events",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateEventPage()),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: bottom_nav_bar(current_index: 0),
      drawer: Drawer(
        backgroundColor: Colors.white60,
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.red),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Options",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  SizedBox(width: 20),
                  Icon(Icons.settings, size: 40, color: Colors.white),
                ],
              ),
            ),
            ListTile(
              selected: selected_index == 0,
              title: const Text(
                "Profile",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            ListTile(
              selected: selected_index == 2,
              title: const Text(
                "Log Out",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              onTap: () => handleLogout(context),
            ),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: eventsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No events found.'));
          }

          final events = snapshot.data!.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return {...data, 'id': doc.id};
          }).toList();

          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return Card(
                color: Color.fromRGBO(73, 138, 145, 1.0),
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Image.network(event['image'] ?? ''),
                      SizedBox(height: 10),
                      Text(
                        event['title'] ?? '',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        event['date'] ?? '',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      SizedBox(height: 5),
                      Text(
                        event['s_details'] ?? '',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  event['liked_by']?.contains(FirebaseAuth.instance.currentUser?.uid) ?? false
                                      ? Icons.thumb_up
                                      : Icons.thumb_up_alt_outlined,
                                  color: event['liked_by']?.contains(FirebaseAuth.instance.currentUser?.uid) ?? false
                                      ? Colors.lightBlue
                                      : Colors.white,
                                ),
                                onPressed: () async {
                                  final userId = FirebaseAuth.instance.currentUser?.uid;
                                  if (userId == null) return; // Ensure the user is logged in

                                  final docRef = FirebaseFirestore.instance.collection('events').doc(event['id']);
                                  final hasLiked = event['liked_by']?.contains(userId) ?? false;

                                  if (hasLiked) {
                                    // Remove like
                                    await docRef.update({
                                      'liked_by': FieldValue.arrayRemove([userId]),
                                      'likes': FieldValue.increment(-1),
                                    });
                                  } else {
                                    // Add like
                                    await docRef.update({
                                      'liked_by': FieldValue.arrayUnion([userId]),
                                      'likes': FieldValue.increment(1),
                                    });
                                  }
                                },
                              ),
                              Text('${event['likes'] ?? 0}'),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.comment, color: Colors.white),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EventDetailsPage(event: event),
                                    ),
                                  );
                                },
                              ),
                              Text('${event['comments'].length ?? 0}')
                            ],
                          ),
                        ],
                      ),
                    ],
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
  final Map<String, dynamic> event;
  final TextEditingController commentController = TextEditingController();

  EventDetailsPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          event['title'] ?? 'Event Details',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(73, 138, 145, 1.0),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.grey, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (event['image'] != null && event['image']!.isNotEmpty)
                Image.network(event['image']!),
              SizedBox(height: 20),
              Text(
                event['title'] ?? '',
                style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                event['details'] ?? '',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 22),
              TextField(
                controller: commentController,
                decoration: InputDecoration(labelText: 'Add a comment'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final docRef = FirebaseFirestore.instance.collection('events').doc(event['id']);
                  final userRef = await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get();
                  final newComment = {
                    'name': userRef['username']??"Anonymous", // Replace with actual user's name if available
                    'comment': commentController.text,
                  };
                  await docRef.update({
                    'comments': FieldValue.arrayUnion([newComment]),
                  });
                  commentController.clear();
                },
                child: Text('Submit Comment'),
              ),
              SizedBox(height: 20),
              Text(
                'Comments',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('events')
                      .doc(event['id'])
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    if (!snapshot.hasData || snapshot.data?.data() == null) {
                      return Center(child: Text('No comments available.'));
                    }

                    final eventData = snapshot.data!.data() as Map<String, dynamic>;
                    final comments = eventData['comments'] as List<dynamic>? ?? [];

                    if (comments.isEmpty) {
                      return Text('No comments yet.');
                    }

                    return ListView.builder(
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        final comment = comments[index] as Map<String, dynamic>;
                        return ListTile(
                          title: Text(comment['name'] ?? 'Anonymous'),
                          subtitle: Text(comment['comment'] ?? ''),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class CreateEventPage extends StatelessWidget {
  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final addressController = TextEditingController();
  final detailsController = TextEditingController();
  final sDetailsController = TextEditingController();
  final imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Publish Your Own Event",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: titleController, decoration: InputDecoration(labelText: 'Title')),
            TextField(controller: dateController, decoration: InputDecoration(labelText: 'Date')),
            TextField(controller: addressController, decoration: InputDecoration(labelText: 'Address')),
            TextField(controller: detailsController, decoration: InputDecoration(labelText: 'Details')),
            TextField(controller: sDetailsController, decoration: InputDecoration(labelText: 'Short Details')),
            TextField(controller: imageController, decoration: InputDecoration(labelText: 'Image URL')),
            SizedBox(height: 16),
            SizedBox(
              height: 60,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent ),
                onPressed: () async {
                  final newEvent = {
                    'title': titleController.text,
                    'date': dateController.text,
                    'address': addressController.text,
                    'details': detailsController.text,
                    's_details': sDetailsController.text,
                    'image': imageController.text,
                    'likes': 0,
                    'comments': [],
                    'liked_by':[]
                  };
                  await FirebaseFirestore.instance.collection('events').add(newEvent);
                  Navigator.pop(context);
                },
                child: Text('Publish',style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}