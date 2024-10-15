import 'dart:convert'; //this importing dart:convert to handle JSON conversion

//Here i am defining the Students class
class Students {
  //Member field that will store the list of people
  List<Map<String, String>> people; //a constructor will accept a List< Map<String, String> >

  Students(this.people); //constructor to initialize the people list

  //sort method to sort the list based on the passed field name
  void sort(String field) {
    people.sort((a, b) => a[field]!.compareTo(b[field]!));
  }

  //Output method to print each item in the list
  void output() {
    for (var person in people) {
      print(person);
    }
  }

  //plus method to add a new person (Map) to the list
  void plus(Map<String, String> person) {
    people.add(person);
  }

  // Remove method to remove an item from the list based on a field value
  void remove(String field, String value) {
    people.removeWhere((person) => person[field] == value);
  }
}

void main() {
  //JSON string that will be converted to a list of maps
  String json = '''
  [
    {"first":"Steve", "last":"Griffith", "email":"griffis@algonquincollege.com"},
    {"first":"Adesh", "last":"Shah", "email":"shaha@algonquincollege.com"},
    {"first":"Tony", "last":"Davidson", "email":"davidst@algonquincollege.com"},
    {"first":"Adam", "last":"Robillard", "email":"robilla@algonquincollege.com"},
    {"first":"Rocien", "last":"Nkunga", "email":"nkun0003@algonquinlive.com}
  ]
  ''';

  // Convert the JSON string to a List<dynamic> and cast it to List<Map<String, dynamic>>
  List<dynamic> decodedList = jsonDecode(json);

  // Explicitly cast the List<dynamic> to List<Map<String, String>>
  List<Map<String, String>> peopleList = List<Map<String, String>>.from(
    decodedList.map((item) => Map<String, String>.from(item)),
  );

  // Create an instance of the Students class
  Students students = Students(peopleList);

  // Call the sort method to sort by the 'last' field
  print('Sorting by last name:');
  students.sort('last');
  students.output(); // Output the sorted list

  // Add a new person using the plus method
  print('\nAdding a new person:');
  students
      .plus({"first": "John", "last": "Doe", "email": "john.doe@email.com"});
  students.output(); // Output the list after adding a new person

  // Remove a person using the remove method based on the 'email' field
  print('\nRemoving person with email john.doe@email.com:');
  students.remove('email', 'john.doe@email.com');
  students.output(); // Output the list after removal
}
