# Create an instance
heaven = Restaurant.new(name: 'Hungry Heaven', address: 'Meguro')
heaven.save

# Destroy an instance
heaven.destroy

# To get all instances
Restaurant.all # an array of everything save

# To get one instance with an id ONLY
Restaurant.find(1)

# To see how many restaurants we have in the DB
Restaurant.count

# To see all the restaurants in Meguro -
"SELECT * FROM restuarants WHERE address = 'Meguro"
Restaurant.where(address: 'Meguro')
# we can still write SQL
Restaurant.where('address LIKE ?', 'meguro')

# To get the restaurant called Sukiya
Restaurant.find_by(name: 'Sukiya')

# The first Restaurant
Restaurant.first
Restaurant.last

# Want to order all the restaurants by name
Restaurant.order(name: :asc)
Restaurant.order(name: :desc)
