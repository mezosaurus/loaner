class BorrowersController < ApplicationController
  before_action :set_borrower, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @borrowers = current_user.borrowers
    respond_with(@borrowers)
  end

  def show
    respond_with(@borrower)
  end

  def new
    @borrower = Borrower.new
    respond_with(@borrower)
  end

  def edit
  end

  def create
    @borrower = Borrower.new(borrower_params)
    @borrower.save
    respond_with(@borrower)
  end

  def update
    @borrower.update(borrower_params)
    respond_with(@borrower)
  end

  def destroy
    @borrower.destroy
    respond_with(@borrower)
  end

  private
    def set_borrower
      @borrower = Borrower.find(params[:id])
    end

    def borrower_params
        params.require(:borrower).permit(:name, :phone, :nickname, :email, :user_id)
    end
end
