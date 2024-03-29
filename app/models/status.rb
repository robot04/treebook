class Status < ActiveRecord::Base

	# == Schema Information
	#
	# Table name: statuses
	#
	#  id         :integer         not null, primary key
	#  content    :text
	#  created_at :datetime        not null
	#  updated_at :datetime        not null
	#  user_id    :integer
	#
  	
  	attr_accessible :content, :user_id
  	belongs_to :user

  	validates :content, presence: true,
  						length: { minimum: 2 }

  	validates :user_id, presence: true
  	
end


