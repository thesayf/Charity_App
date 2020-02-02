# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

=begin

All the Models are instantiated with timestamps which are required and automatically updated by Rails.

The User class is an absract class so there is no user_table and it cannot be instantiated.

Resident inherits from User and a resident can have many subscriptions as well as projects through the subscriptions
name is required and unique, email is not required but unique, password and password_confirmation are both required.

Employee inherits from user and belongs to a charity, it is destroyed when the charity is destroyed
name is required and unique, email is not required but unique, password and password_confirmation are both required. the charity_id is also required

Admin inherits from user and can have/create a single charity
name is required and unique, email is not required but unique, password and password_confirmation are both required. the charity_id is also required

Charity has many employees and belongs to an admin "Currently there is no scope for the :dependent value as I am not sure we want to delete the charity if an admin is deleted"
name is required and unique, description and business address are both not required and the admin_id is required on the charity

A project belongs to a charity(and is destroyed when the charity is destroyed) whereas a project can have many subscriptions, residents and sessions
name is required and unique, description, latitude, longitude and project type are not required

Subscription is the join table between residents and projects i.e A resident can have many subscriptions and project via this subscriptions and the projects too

Session belongs to a Project and is destroyed if the project is destroyed
it's location is required

The seed data works only in development to just test out things.
=end

if Rails.env.development?
  puts "*" * 20
  puts "seeding the database in development mode only"
  ActiveRecord::Base.transaction do
    admin = Admin.create! name: 'ROri', email: 'rori@gmail.com', password: 'rori_dev', password_confirmation: 'rori_dev'
    charity = Charity.create! name: 'Rori Charity', admin_id: admin.id, description: 'My First Charity Organization', business_address: '1 Oak Street, Beijin'
    resident = Resident.create! name: 'ladi', email: 'ladi@gmail.com', password: 'ladi_dev', password_confirmation: 'ladi_dev'
    Employee.create! name: 'new', email: 'new@gmail.com', password: 'new_employee', password_confirmation: 'new_employee', charity_id: charity.id
    project = Project.create! name: 'Feed the Poor', description: 'We would help feed the poor', latitude: '20.45', longitude: '20.45', project_type: 'impact', charity_id: charity.id
    Subscription.create! project_id: project.id, resident_id: resident.id
    Session.create! location: 'Near here', description: 'Meeting to deliberate', business_address: 'Not needed', project_id: project.id
  end

  puts "*" * 20
  puts "ended"
end
