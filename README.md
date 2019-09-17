MT OLYMPUS


### Request Endpoints
+ [Olympians](#olympians)
+ [Olympian Stats](#olympian_stats)
+ [Events](#events)

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
