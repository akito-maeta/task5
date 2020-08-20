class Book < ApplicationRecord
	belongs_to :user
	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

  def self.search(search,content)
    if search == "forward_match"
      @book = Book.where("title LIKE?","#{content}%")
    elsif search == "backward_match"
      @book = Book.where("title LIKE?","%#{content}")
    elsif search == "perfect_match"
      @book = Book.where("title LIKE?","#{content}")
    elsif search == "partial_match"
      @book = Book.where("title LIKE?","%#{content}%")
    else
      @book = Book.all
    end
  end
end
