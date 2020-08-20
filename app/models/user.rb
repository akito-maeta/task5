class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
  attachment :profile_image, destroy: false

  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name, length: {maximum: 20, minimum: 2}
  validates :introduction, length: {maximum: 50}

  def self.search(search,content)
    if search == "forward_match"
      @user = User.where("name LIKE?","#{content}%")
    elsif search == "backward_match"
      @user = User.where("name LIKE?","%#{content}")
    elsif search == "perfect_match"
      @user = User.where("name LIKE?","#{content}")
    elsif search == "partial_match"
      @user = User.where("name LIKE?","%#{content}%")
    else
      @user = User.all
    end
  end
end
