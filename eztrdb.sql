-- Myles Crouther, David Willoughby, Jonathan Stuppin
-- University of Arizona Global Campus
-- INT 499 - Capstone for Information Technology (INP2350A)
-- Professor: Joseph Issa


Table users {
  id integer [primary key]
  username varchar
  role varchar
  created_at timestamp
}

Table content {
  id integer [primary key]
  title varchar
  body text [note: 'Footage Description']
  runtime integer
  created_at timestamp
}
