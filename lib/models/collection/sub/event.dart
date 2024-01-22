import 'package:flutter/material.dart';

class Event with ChangeNotifier {
  String id = "";
  String title;
  String notes;
  String category;
  List<String> tags;
  String photoURL;
  List<Map<DateTime, TimeOfDay>> dateAndTime;
  bool isRepeating;
  List<Map<RepeatFrequency, List>> repetition;
  List<Map<String, String>> location;
  double ticketCost;
  int numberOfTickets;

  Event({
    required this.title,
    required this.notes,
    required this.category,
    required this.tags,
    required this.photoURL,
    required this.dateAndTime,
    required this.isRepeating,
    required this.repetition,
    required this.location,
    required this.ticketCost,
    required this.numberOfTickets,
  });

  // Factory constructor to create an Event instance from a Firebase snapshot
  factory Event.fromMap(Map<String, dynamic> data, String documentId) {
    return Event(
      title: data['title'],
      notes: data['description'],
      category: data['category'],
      tags: List<String>.from(data['tags']),
      photoURL: data['photoURL'],
      dateAndTime: List<Map<DateTime, TimeOfDay>>.from(data['dateAndTime']),
      isRepeating: data['isRepeating'],
      repetition: List<Map<RepeatFrequency, List>>.from(data['repetition']),
      location: List<Map<String, String>>.from(data['location']),
      ticketCost: data['ticketCost'],
      numberOfTickets: data['numberOfTickets'],
    );
  }

  // Method to convert Event instance to a map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'notes': notes,
      'category': category,
      'tags': tags,
      'photoURL': photoURL,
      'dateAndTime': dateAndTime,
      'isRepeating': isRepeating,
      'repetition': repetition,
      'location': location,
      'ticketCost': ticketCost,
      'numberOfTickets': numberOfTickets,
    };
  }
}

// ignore: unused_element
TimeOfDay _convertMapToTimeOfDay(Map<String, dynamic> timeMap) {
  // Assuming 'hour' and 'minute' are the keys in your Firestore data
  int hour = timeMap['hour'];
  int minute = timeMap['minute'];
  return TimeOfDay(hour: hour, minute: minute);
}

enum RepeatFrequency {
  Daily,
  Weekly,
  Monthly,
  Yearly,
}


enum ReferenceType {
  task,
  event,
  schedule,
  meal,
}