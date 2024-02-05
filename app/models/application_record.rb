=begin
Represents the abstract structure of the database.
Superclass to organization, region, resource category, ticket, and user.
=end

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
