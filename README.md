# proximity-calculator
Application to read a file and get customers within 100km

# Problem
We have some customer records in a text file (customers.json) -- one customer per line, JSON-encoded. We want to invite any customer within 100km of our Dublin office for some food and drinks on us. Write a program that will read the full list of customers and output the names and user ids of matching customers (within 100km), sorted by User ID (ascending).

* You can use the first formula from this [Wikipedia article](https://en.wikipedia.org/wiki/Great-circle_distance) to calculate distance. Don't forget, you'll need to convert degrees to radians.
* The GPS coordinates for our Dublin office are 53.3381985, -6.2592576.
* You can find the Customer list [here](https://gist.github.com/brianw/19896c50afa89ad4dec3#file-gistfile1-txt).
