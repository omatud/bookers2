class UsersController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    if @book.save
      flash[:hoge] = "You have created book successfully."
    redirect_to book_path(@book.id)
    else
      @books=Book.all
      render :index
    end

  end

  def index
    @user=User.find(current_user.id)
    @users=User.all
    @book_new=Book.new
  end

  def show
    @user=User.find(params[:id])
    @books=@user.books
    @book_new=Book.new
  end

  def edit
    @user =User.find(params[:id])
    if current_user==@user
     render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
   @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:hoge] = "You have created book successfully."
    redirect_to user_path(@user.id)
    else
      @users=User.all
      render :edit
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
