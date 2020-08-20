class SearchController < ApplicationController

  def search
    content = params[:content]
    @model = params[:model]
    search = params[:search]
    if @model == 'user'
      @user = User.search(search,content)
    else
      @book = Book.search(search,content)
    end
  end

end
