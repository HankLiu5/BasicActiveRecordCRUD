# Only need this because we've set dependent: destroy in User class.
User.destroy_all

due_date = Date.today + 1.year

# Here we use exclamation because it will warn you if something goes wrong.
# The regular create won't tell you anything if fail.
Profile.create!([
{ first_name: "Carly",   last_name: "Fiorina", birth_year: 1954, gender: "female" },
{ first_name: "Donald",  last_name: "Trump",   birth_year: 1946, gender: "male" },
{ first_name: "Ben",     last_name: "Carson",  birth_year: 1951, gender: "male" },
{ first_name: "Hillary", last_name: "Clinton", birth_year: 1947, gender: "female" }])

# store all stuff in Profile class in a variable.
profiles = Profile.all

profiles.each do |profile|
  profile.create_user( username: profile.last_name, password_digest: profile.birth_year)
  # It's that User and TodoList have one-to-many relationship, not with Profile.
  profile.user.todo_lists.create!(list_name: profile.first_name, list_due_date: due_date)
end

todolists = TodoList.all

todolists.each do |list|
  # according to the requirement of assignment, we need 5 items in each list.
  5.times do
    list.todo_items.create!(due_date: due_date, title: "Title", description: "description")
  end
end
