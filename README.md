# proximity-calculator
Application to read a file and list all customers within 100km of a given latitude and longitude. This program uses the haversine formula to make the calculation.

![Alt text](/screenshot.png?raw=true "Weather App")

### Dependencies
* Bundler
* Ruby 2.0 or higher

###Setup
```gem install bundler```

```bundle install```

### Running
**Run the program**

```bundle exec rake customer_proximity:find_users_within_100_km```

**Running the tests**

To run both quality checks and test run bundle exec rake

Alternatively run quality and tests individually but running the following respectfully

```bundle exec rake rspec```

```bundle exec rake rubocop```

### Problem
We have some customer records in a text file (customers.json) -- one customer per line, JSON-encoded. We want to invite any customer within 100km of our Dublin office for some food and drinks on us. Write a program that will read the full list of customers and output the names and user ids of matching customers (within 100km), sorted by User ID (ascending).

* You can use the first formula from this [Wikipedia article](https://en.wikipedia.org/wiki/Great-circle_distance) to calculate distance. Don't forget, you'll need to convert degrees to radians.
* The GPS coordinates for our Dublin office are 53.3381985, -6.2592576.
* You can find the Customer list [here](https://gist.github.com/brianw/19896c50afa89ad4dec3#file-gistfile1-txt).
