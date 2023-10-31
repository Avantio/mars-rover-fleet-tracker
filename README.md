## Description

The Mars Rover Fleet Tracker Service is a robust and efficient tracking system designed to monitor and manage our fleet of Mars rovers. This service plays a crucial role ensuring the successful exploration of the Martian terrain.

Now seriously... This is a simple app which only purpose it to simulate the behaviour of a live app. It has:
- `/` dummy endpoint which returns a static message.
- `/health` a health endpoint which returns `{ status: 'UP' }` in case everything is right.
- `/metrics` endpoing is used to expose the randomly generated metrics in Prometheus format (updated every second).

You can configure the app using the following environment variables:
- `PORT` - the port where the app will be listening to. Default: `3000`.
- `UPDATE_INTERVAL` - the interval in milliseconds to update the metrics. Default: `1000`.

The exposed metrics are:
- `wind_speed{rover_name}` - the wind speed in meters per second reported by a given rover.
- `temperature{rover_name}` - the temperature in celsius degrees reported by a given rover.

**Examples of the metrics:**
```
# HELP wind_speed Wind speed in kph
# TYPE wind_speed gauge
wind_speed{rover_name="perseverance"} 17.486874294614452
wind_speed{rover_name="curiosity"} 152.45869662620908
wind_speed{rover_name="spirit"} 79.65904584768795
wind_speed{rover_name="opportunity"} 7.509377261260672

# HELP temperature Temperature in celsius
# TYPE temperature gauge
temperature{rover_name="perseverance"} -21.565797792825474
temperature{rover_name="curiosity"} -96.8363251757358
temperature{rover_name="spirit"} 57.00957765647951
temperature{rover_name="opportunity"} -24.125939861156784
```

## Installation

```bash
$ npm install
```

## Running the app

```bash
# development
$ npm run start

# watch mode
$ npm run start:dev
```

## Building the app

```bash
$ npm run build
```

## Test

```bash
# unit tests
$ npm run test

# e2e tests
$ npm run test:e2e

# test coverage
$ npm run test:cov
```

---

MIT License

[Avantio](https://www.avantio.com/)
