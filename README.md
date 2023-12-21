# Flutter Movie Application

This Flutter application is a simple movie app that retrieves category and movie information from an SQLite database and presents it to the user.

## Features


1. **Category Selection**: Users can choose a category from the list displayed on the main screen of the application.

2. **Movie List**: Based on the selected category, the application fetches a list of movies from the SQLite database and displays it on the screen.

3. **Movie Details**: When a user selects a movie from the list, the screen updates to show the details of the chosen film.
![Ekran görüntüsü 2023-12-21 204502](https://github.com/emreyilldirrm/movie_app2/assets/149498114/6de5c430-c248-4890-9d0f-2f3e0e1a0d71)
![Ekran görüntüsü 2023-12-21 204556](https://github.com/emreyilldirrm/movie_app2/assets/149498114/013b7bbe-fc44-40b3-ae68-6c88ae1d1899)
![Ekran görüntüsü 2023-12-21 204543](https://github.com/emreyilldirrm/movie_app2/assets/149498114/02c0b18b-3be7-435e-9c64-c867503ea2cf)
![Ekran görüntüsü 2023-12-21 204527](https://github.com/emreyilldirrm/movie_app2/assets/149498114/9e46b324-4f89-40fe-8981-63f0ebfc0e76)

## App Flow

1. Upon launching the application, the main screen shows the user the available category list.

2. After the user selects a category, the application fetches movies belonging to the selected category from the SQLite database.

3. The movie list is then displayed under the chosen category.

4. When the user selects a desired movie, the screen updates with the details of the selected film.

## Used Packages

This application utilizes the `sqflite` package for SQLite database operations in Flutter. Project dependencies are specified in the `pubspec.yaml` file.

```yaml
dependencies:
  sqflite: ^2.0.0
