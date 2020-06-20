# here i can create seed data to work with and test associations

#  create some users
samantha = User.create(name: "Samantha", email: "samantha@samantha.com", password: "password")
dominick = User.create(name: "Dominick", email: "dominick@dominick.com", password: "password")

# create some books
Book.create(title: "A Bend in the Road" , author: "Nicholas Sparks" , genre: "Ramance" , user_id: samantha.id)
Book.create(title: "A Walk to Remember" , author: "Nicholas Sparks" , genre: "Ramance" , user_id: dominick.id)

# we can also use active record to pre-association data
samantha.books.create(title: "One for the Money" , author: "Janet Evanovich", genre: "Comendy" )

