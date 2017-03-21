# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# cats = Cat.create([
#   {name: "Caesar", birth_date: '2004-01-01', sex: 'M', color: 'Black' },
#   {name: "Julius", birth_date: '2007-08-01', sex: 'M', color: 'White' },
#   {name: "Augustus", birth_date: '2009-12-01', sex: 'M', color: 'Grey' },
#   {name: "Octavian", birth_date: '2003-08-01', sex: 'M', color: 'Gold' },
#   {name: "Cleopatra", birth_date: '1999-08-11', sex: 'F', color: 'Silver' },
#   {name: "Cornelia", birth_date: '2010-11-01', sex: 'F', color: 'Brown' }
# ])

cat_rental_requests = CatRentalRequest.create([
  {cat_id: 1, start_date: '2017-03-21', end_date: '2017-03-22'},
  {cat_id: 1, start_date: '2017-03-20', end_date: '2017-03-23'},
  {cat_id: 5, start_date: '2017-03-18', end_date: '2017-03-25'},
  {cat_id: 5, start_date: '2017-03-26', end_date: '2017-04-01'},
  {cat_id: 6, start_date: '2017-03-16', end_date: '2017-03-27'},
  {cat_id: 7, start_date: '2017-03-15', end_date: '2017-03-28'}
])
