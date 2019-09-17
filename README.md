# MT OLYMPUS

Mt Olympus is an API that opens endpoints to return statistics and information about the 2016 Summer Olympic Games. I created all of the endpoints, documentation, and agile board with user stories for Mt Olympus in less than two days as a take home challenge during Module 4 at the Turing School of Software and Design in Denver, Colorado during the 1908 inning. While there was a 48 hour time limit on this challenge from first to last commit, I would not have been able to complete what I did on Mt Olympus without all of the 12-14+ hour days that I put in to learn these skills over the last seven months, not to mention everyone who has helped me along the way. It has been so much fun to learn this process and to be surrounded by so many intelligent and driven people at Turing.

Thank you all.

### About

Mt Olympus is built using Ruby (version 2.6.3) along with Ruby on Rails (version 6.0.0). It utilizes a PostgreSQL database (version 11.5) for storing records and uses RSpec with ShouldaMatchers for testing. The application can run in a development environment on your local machine, and it is also deployed to Heroku. Mt Olympus was built using a Test Driven Development (TDD) approach and adheres to RESTful practices.

### Configuration

While this application is deployed in a production environment and you can interact with the endpoints outlined below, you can also run the codebase on your local machine by following these steps:
1. Fork this repository, then clone it to your local machine.
1. Open the repository in your text editor of choice.
1. From your terminal/command line interface (CLI), run `bundle install` to install the required dependencies.
1. From your terminal/CLI, run `bundle exec rake db:{create,migrate}` to create the database and accompanying tables.
1. From your terminal/CLI, run `bundle exec rake import_csv:summer_olympics_2016` to import the records from the included CSV file into your new database.
1. You should see a message confirming the number of records created and can also confirm that the database tables have been populated by using a DB interfacing tool like Postico or by running `rails console` in your CLI and running a comman like `Olympian.count`.
1. Have fun!

### Request Endpoints
+ [Olympians](#olympians)
+ [Olympian Stats](#olympian_stats)
+ [Events](#events)

The following endpoints have been created for you to access on the production application. Outlined below is the endpoint, the type of requests it takes (along with any parameters or variants it receives), and the expected response that it returns.

### <a name="olympians"></a>Olympians Request
`https://mt-olympus.herokuapp.com/api/v1/olympians`

HTTP verbs accepted: `GET`  
Parameters accepted: `age`

The olympians endpoint receives a GET request and returns a JSON formatted object containing a list of olympians from the 2016 summer games. By default, the first 25 olympians are returned.

An example of a successful request:
```
GET https://mt-olympus.herokuapp.com//api/v1/olympians
Content-Type: application/json
Accept: application/json
```
Successful response:
```
status: 200 OK
body:

{
  "olympians":
  [
    {
        "name": "Andreea Aanei",
        "team": "Romania",
        "age": 22,
        "sport": "Weightlifting",
        "total_medals_won": 0
    },
    {
        "name": "Nstor Abad Sanjun",
        "team": "Spain",
        "age": 23,
        "sport": "Gymnastics",
        "total_medals_won": 0
    },
    {
        "name": "Antonio Abadia Beci",
        "team": "Spain",
        "age": 26,
        "sport": "Athletics",
        "total_medals_won": 0
    },
    {...}
  ]
}
```

### <a name="olympian_stats"></a>Olympian Stats Request
`https://mt-olympus.herokuapp.com/api/v1/olympians`

HTTP verbs accepted: `GET`

The olympian stats endpoint receives a GET request and returns a JSON formatted object containing aggregate statistics about the olympians in the 2016 Summer Games.

An example of a successful request:
```
GET https://mt-olympus.herokuapp.com//api/v1/olympian_stats
Content-Type: application/json
Accept: application/json
```
Successful response:
```
status: 200 OK
body:

{
  "olympian_stats":
    {
        "total_competing_olympians": 2850,
        "average_weight":
          {
              "unit": "kg",
              "male_olympians": "77.87",
              "female_olympians": "61.40"
          },
        "average_age": "26.37"
    }
}
```

### <a name="events"></a>Events Request
`https://mt-olympus.herokuapp.com/api/v1/events`

HTTP verbs accepted: `GET`   
Variants accepted: `/:id/medalists`

The events endpoint receives a GET request and returns a JSON formatted object containing all of the sports with each sport's accompanying events. The events endpoint can also receive an event ID along with `/medalists` in which case it will respond with the medalists for that specific event.

An example of a successful request (without an ID and `/medalists`):
```
GET https://mt-olympus.herokuapp.com//api/v1/events
Content-Type: application/json
Accept: application/json
```
Successful response:
```
status: 200 OK
body:

{
  "events":
  [
    {
      "sport": "Archery",
      "events":
        [
          "Archery Women's Individual",
          "Archery Women's Team",
          "Archery Men's Individual",
          "Archery Men's Team"
        ]
    },
    {
      "sport": "Gymnastics",
      "events":
        [
          "Gymnastics Men's Individual All-Around",
          "Gymnastics Men's Floor Exercise",
          "Gymnastics Men's Parallel Bars",
          "Gymnastics Men's Horizontal Bar",
          "Gymnastics Men's Rings",
          "Gymnastics Men's Pommelled Horse",
          "Gymnastics Men's Team All-Around",
          "Gymnastics Men's Horse Vault",
          "Gymnastics Women's Team All-Around",
          "Gymnastics Women's Uneven Bars",
          "Gymnastics Women's Balance Beam",
          "Gymnastics Women's Individual All-Around",
          "Gymnastics Women's Floor Exercise",
          "Gymnastics Women's Horse Vault"
        ]
    },
    {...}
  ]
}
```
An example of a successful request with an event ID and `/medalists`:
```
GET https://mt-olympus.herokuapp.com//api/v1/events/100/medalists
Content-Type: application/json
Accept: application/json
```
An example of a successful response:
```
status: 200 OK
body:

{
  "event": "Rhythmic Gymnastics Women's Group",
  "medalists":
    [
      {
          "name": "Sandra Aguilar Navarro",
          "team": "Spain",
          "age": 23,
          "medal": "Silver"
      },
      {
          "name": "Vera Leonidovna Biryukova",
          "team": "Russia",
          "age": 18,
          "medal": "Gold"
      },
      {
          "name": "Anastasiya Ilyinichna Bliznyuk",
          "team": "Russia",
          "age": 22,
          "medal": "Gold"
      }
    ]
}
```
