class User < ActiveRecord::Base

  # == Schema Information
  #
  # Table name: users
  #
  #  id                     :integer         not null, primary key
  #  first_name             :string(255)
  #  last_name              :string(255)
  #  profile_name           :string(255)
  #  email                  :string(255)     default(""), not null
  #  encrypted_password     :string(255)     default(""), not null
  #  reset_password_token   :string(255)
  #  reset_password_sent_at :datetime
  #  remember_created_at    :datetime
  #  sign_in_count          :integer         default(0)
  #  current_sign_in_at     :datetime
  #  last_sign_in_at        :datetime
  #  current_sign_in_ip     :string(255)
  #  last_sign_in_ip        :string(255)
  #  created_at             :datetime        not null
  #  updated_at             :datetime        not null
  #



  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :profile_name, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :profile_name, presence: true, 
                           uniqueness: true, 
                           format: { 
                            with: /^[a-zA-Z0-9_-]+$/, 
                            message: 'Profile name must be formatted correctly'
                          }

  has_many :statuses

  def full_name
  	first_name + " " + last_name
  end

  def gravatar_url
    stripped_email = email.strip
    downcased_email = stripped_email.downcase
    hash = Digest::MD5.hexdigest(downcased_email)

    "http://gravatar.com/avatar/#{hash}"
  end

end

