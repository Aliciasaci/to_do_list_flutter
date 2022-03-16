import 'package:faker/faker.dart';
import 'package:todolist/models/task.dart';

////C'est pas une bonne idée d'utiliser random.boolean() pour générer l'état de la task
// Generate random DateTime, between the years 2000 and 2020 print(faker.date.dateTime(minYear: 2000, maxYear: 2020));
List<Task> tasks = [
  Task(1, "Go to the gym", true,
      faker.date.dateTime(minYear: 2022, maxYear: 2023)),
  Task(2, "cook my meals", true,
      faker.date.dateTime(minYear: 2022, maxYear: 2023)),
  Task(3, "meditate", false,
      faker.date.dateTime(minYear: 2022, maxYear: 2023)),
  Task(4, "drink 8 glasses of water today", false,
      faker.date.dateTime(minYear: 2022, maxYear: 2023)),
  Task(5, "journal", false,
      faker.date.dateTime(minYear: 2022, maxYear: 2023)),
  Task(
      6, "read for 20 minutes a day", true, faker.date.dateTime(minYear: 2022, maxYear: 2023)),
  Task(7, "finish homework", false, faker.date.dateTime(minYear: 2022, maxYear: 2023)),
  Task(8, "go back to x for y", false,
      faker.date.dateTime(minYear: 2022, maxYear: 2023)),
  Task(9, "clean my room", true,
      faker.date.dateTime(minYear: 2022, maxYear: 2023)),
  Task(10, "go for a run", true,
      faker.date.dateTime(minYear: 2022, maxYear: 2023)),
  Task(11, "make time to watch a movie", true,
      faker.date.dateTime(minYear: 2022, maxYear: 2023)),
  Task(
      12, "sleep at 23h", true, faker.date.dateTime(minYear: 2022, maxYear: 2023)),
  Task(13, "go shopping", false,
      faker.date.dateTime(minYear: 2022, maxYear: 2023)),
  Task(14, "clean the car", true,
      faker.date.dateTime(minYear: 2022, maxYear: 2023)),
  Task(15, "walk the dog", false,
      faker.date.dateTime(minYear: 2022, maxYear: 2023)),
];