# SimpleResponseCycleWebService

A simple REST API implemented in Rails 5 with token authentication.



# Authentication Features
Because this API uses token authentication, you will need an authentication token.

You can access the admin token with the following after performing database migrations:

```bash
rails dbconsole
sqlite> select api_key from users;
```

If you prefer to have your very own API key token, you can create one just like below:

```bash
curl -X POST -H "Content-Type: application/json" -H "Authorization: Token <MY AWESOME API KEY>" -d '{"user": {"name": "Brian", "email": "itsbriany@gmail.com"}}' http://localhost:3000/users
```

You should get your authentication token in the JSON response.

***Please note, that this is a JSON only API, so you must specify the following HTTP headers:***

    Content-Type: application/json
    Authorization: Token <MY AWESOME API KEY>






# Security Features

The [Rack::Attack](https://github.com/kickstarter/rack-attack) enhances DDoS protection. Because of this, incoming requests are throttled every 5 seconds.

*If you wish to disable this feature, you can disable the `Rack::Attack` middleware in `config/application.rb`






# The I <3 CloudComputing Part

You can send HTTP POST requests to /cloud_computing to stress test the API and load balancing.

### Example

```bash
curl -X POST -H "Content-Type: application/json" -H "Authorization: Token <MY AWESOME API TOKEN>" -d '{"cloud_computing": {"id": 1, "payload_size": 10}}'  http://localhost:3000/cloud_computing
```
   Will return something like the following:
   
```json
{ "cloud_computing":
    { 
      "payload":"guh7CgE0wx",
      "timestamp":"2016-04-13T17:39:51.917-03:00",
      "execution_delay":0.00011515617370605469 
    }
}
```

In other words, a response will have:

 - A random payload the size of the bytes specified in **payload_size**
 - A timestamp of creation
 - The time it took to generate the payload
