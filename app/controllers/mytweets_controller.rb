class MytweetsController < ApplicationController
  before_action :set_mytweet, only: [:show, :edit, :update, :destroy]

  def index
    @mytweets = Mytweet.all
  end

  def new
    @mytweet = Mytweet.new
  end

  def create
    @mytweet = Mytweet.new(mytweet_params)

    if params[:back]
          render :new
    else
      if @mytweet.save
        redirect_to mytweets_path, notice: "New tweet has created！"
      else
        render 'new'
      end
    end
  end

  def show

  end

  def edit

  end

  def update
    if @mytweet.update(mytweet_params)
      redirect_to mytweets_path, notice: "Tweet has been edited！"
    else
      render :edit
    end
  end


  def destroy
    @mytweet.destroy
    redirect_to mytweets_path, notice:"The tweet has been deleted！"
  end

  def confirm
    @mytweet = Mytweet.new(mytweet_params)
    render :new if @mytweet.invalid?
  end

  private

  def mytweet_params
    params.require(:mytweet).permit(:content)
  end

  def set_mytweet
    @mytweet = Mytweet.find(params[:id])
  end
end
