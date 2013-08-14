Design.destroy_all
# Embedded docs start off with new, cannot create
# Embedded docs cannot be created until it has an object to live inside
e1 = Expectation.new(
  behavior: "Listen to others"
)
e2 = Expectation.new(
  behavior: "Treat others the way I would like to be treated"
)
e3 = Expectation.new(
  behavior: "Try my best"
)
p1 = Period.new(
  name: "Period 1",
  activity: "Getting ready",
  starts_at: "09:00",
  ends_at: "11:00",
  expectations: [e1, e2, e3]
)
p2 = Period.new(
  name: "Period 2",
  activity: "Doing work",
  starts_at: "11:15",
  ends_at: "12:00",
  expectations: [e1, e2, e3]
)
p3 = Period.new(
  name: "Period 3",
  activity: "Cleaning up",
  starts_at: "12:15",
  ends_at: "14:00",
  expectations: [e1, e2, e3]
)
# Now that embedded docs are made, create the model that holds them all
d = Design.create(
  title: "My Cool Report Design",
  periods:[p1, p2, p3]
)