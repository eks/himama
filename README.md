# README

### Please describe your process for approaching the code challenge. What kind of planning did you do? Did your plans change as you began coding?

I planned to keep the application as simple as possible.
I chose some gems to help with the work.
I created a to-do list and did some research before starting coding.
Yes, the plans have changed.
 As I developed the application some problems became more challenging than expected and therefore I ended up de-prioritizing the frontend implementation.


### Describe the schema design you chose. Why did you choose this design? What other alternatives did you consider?

I chose to keep the project simple, so I only developed two models.
User Model so that the application can have several users and each user has a login to enter the application and register their time.
TimeEntry that records the day, start time and end time.
This way a user can have many time entries in the same day.
I chose to register the start and end time as epoch, being an integer, it would make easier to calculate the difference between start and end time.
Consider using the timestamp for the start and end fields


### If you were given another day to work on this, how would you spend it? What if you were given a month?

With one more day to work on the application, I would focus on improving code design, moving business logic from the controller to a service class, writing end-to-end tests, and developing a user-friendly interface.
With another month of work, I would transform the application into an API and develop a reactive frontend, pay technical debts and add new features such as:
- Grouping of entries by day for better visualization
- Would add a clock on the screen
- Add an administrative interface with reports for each user
- As an API a mobile app could be developed
- Would add frontend validations for better usability
- Would add validation to prevent the user from creating undefined entries for the same day
- Would add validation so the user doesn't accidentally create very short entries





### Dependencies

- [Ruby 2.7.1](ruby-lang.org/en/news/2021/04/05/ruby-2-7-3-released/)
- [Node.js](https://nodejs.org/en/download/)
- [Yarn](https://yarnpkg.com/getting-started)
- [Docker](https://docs.docker.com/get-docker/)
- [Docker compose](https://docs.docker.com/compose/install/)

#### Docker Installation

- [Ubuntu Guide](https://docs.docker.com/engine/install/ubuntu)
- [MacOS Guide](https://docs.docker.com/docker-for-mac/install)

For Docker Compose installation, follow this [Docker Compose Guide](https://docs.docker.com/compose/install/)

#### App Setup

You may have to use `sudo` to execute the following commands:

```bash
docker login
```

This command will configure services and make them available:

```bash
docker-compose up --build
```

This command will drop and create database, load tables from schema and then migrate pending migrations:

```bash
docker-compose run web rails db:reset db:migrate
```

This command will open rails console if needed:

```bash
docker-compose run web rails c
```

Docker-compose will use these ports:

- 3000 for app
- 5432 for PostgreSQL

