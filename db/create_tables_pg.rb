require 'pg'

db = PG::Connection.open(:dbname => 'address_bloc')

db.exec("DROP TABLE IF EXISTS address_book cascade;");
db.exec("DROP TABLE IF EXISTS entry cascade;");

db.exec (
    "CREATE TABLE address_book (
      id SERIAL PRIMARY KEY,
      name VARCHAR(30)
    )"
  )

db.exec (
    "CREATE TABLE entry (
      id SERIAL PRIMARY KEY,
      address_book_id INTEGER,
      name VARCHAR(30),
      phone_number VARCHAR(30),
      email VARCHAR(30),
      FOREIGN KEY (address_book_id) REFERENCES address_book(id)
    )"
  )
