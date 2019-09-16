MT OLYMPUS


### Request Endpoints
+ [Olympians](#olympians)

### <a name="olympians"></a>Olympians Request
`https://mt-olympus.herokuapp.com/api/v1/olympians`

HTTP verbs accepted: `GET`
Parameters accepted: `youngest`, `oldest`

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
