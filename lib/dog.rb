require 'active_record'

class Dog < ActiveRecord::Base
  # attributes: name, breed

  def self.create(attributes)
    dog = Dog.new(attributes)
    dog.save
    dog
  end

  def save
    super
    self
  end

  def update(attributes)
    self.attributes = attributes
    save
  end

  def self.find_or_create_by(attributes)
    dog = Dog.find_by(attributes)
    dog ||= Dog.create(attributes) #if true dont create
    dog
  end

  def self.find_by_name(name)
    Dog.find_by(name: name)
  end

  def self.find_by_id(id)
    Dog.find_by(id: id)
  end
end



# Dog
#   inheritence
#     inherits from ActiveRecord::Base
#   attributes
#     has a name and a breed (FAILED - 1)
#   .create
#     takes in a hash of attributes and uses metaprogramming to create a new dog object. Then it uses the #save method to save that dog to the database (FAILED - 2)        
#   .save
#     saves an instance of the dog class to the database and then sets the given dogs `id` attribute (FAILED - 3)
#   .update
#     updates the record associated with a given instance (FAILED - 4)
#   .find_or_create_by
#     creates a dog if it does not already exist (FAILED - 5)
#   .find_by_name
#     returns a dog that matches the name from the DB (FAILED - 6)
#   .find_by_id
#     returns a dog that matches the name from the DB (FAILED - 7)
