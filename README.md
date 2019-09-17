MT OLYMPUS


### Request Endpoints
+ [Olympians](#olympians)
+ [Olympian Stats](#olympian_stats)

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
