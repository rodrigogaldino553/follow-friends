class User < ApplicationRecord
  after_create :assign_default_role, :generate_qrcode

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :followed_users
  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :following_users


  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end

  def assign_role(role)
    self.add_role(role)
  end

  def username
    self.email.split(/@/).first
  end

  def generate_qrcode
    user_url =  "http://#{Rails.configuration.action_mailer.default_url_options[:host]}/users/#{self.id}"
    qrcode = RQRCode::QRCode.new(user_url)

    svg_qrcode = qrcode.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 11,
      standalone: true,
      use_path: true
    )

    self.update_attribute(:qrcode, svg_qrcode)
  end
end
