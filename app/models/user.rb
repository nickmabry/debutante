class User < ActiveRecord::Base
  attr_accessible :github_name, :has_voted
  has_many :projects
end