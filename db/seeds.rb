# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
Keyword.destroy_all
User.destroy_all

User.create!([
    {
  id: 1,
  email: "zeha@gmail.com",
  password: "123456"
},
  {
  id: 99,
  email: "mlarson@mills.info",
  password: "mlarson@mills.info"
},
{
  id: 100,
  email: "shanie.armstrong@lubowitz.com",
  password: "shanie.armstrong@lubowitz.com"
},
{
  id: 101,
  email: "myah.mcclure@gmail.com",
  password: "myah.mcclure@gmail.com"
}
])

p "Created #{User.count} users"


Keyword.create!([
  {
    id: 2001,
    query: "how to create your coaching frameworks",
    created_at: 'Tue, 06 Dec 2022 20:48:40.295579000 UTC +00:00',
    updated_at: 'Tue, 06 Dec 2022 20:48:40.295579000 UTC +00:00',
    user_id: 99
},
  {
    id: 2002,
    query: "placing calls in salesforce",
    created_at: 'Tue, 06 Dec 2022 20:48:40.295579000 UTC +00:00',
    updated_at: 'Tue, 06 Dec 2022 20:48:40.295579000 UTC +00:00',
    user_id: 99
},
  {
    id: 2003,
    query: "placing calls in salesforce",
    created_at: 'Tue, 06 Dec 2022 20:48:40.295579000 UTC +00:00',
    updated_at: 'Tue, 06 Dec 2022 20:48:40.295579000 UTC +00:00',
    user_id: 100
},
  {
    id: 2004,
    query: "how to snippet a call ",
    created_at: 'Tue, 06 Dec 2022 20:48:40.295579000 UTC +00:00',
    updated_at: 'Tue, 06 Dec 2022 20:48:40.295579000 UTC +00:00',
    user_id: 100
}
])

p "Created #{Keyword.count} keyword query"
