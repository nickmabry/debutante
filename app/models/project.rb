class Project < ActiveRecord::Base
  attr_accessible :description, :short_description, :title, :user_id, :votes, :url
  belongs_to :user
end
