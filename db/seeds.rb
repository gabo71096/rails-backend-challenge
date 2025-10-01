# Seed data is intentionally left blank.
# Candidates can add sample clients/providers/availabilities once their schema is in place.

if Rails.env.development?
  Client.create(
    name: "John",
    last_name: "Doe"
  )
  Provider.create(
    name: "Jane 1",
    last_name: "Doe"
  )
  Provider.create(
    name: "Jane 2",
    last_name: "Doe"
  )
  Provider.create(
    name: "Jane 3",
    last_name: "Doe"
  )
end
