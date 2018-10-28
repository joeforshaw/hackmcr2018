require 'clockwork'

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(create_params)
    if @user.save
      response = send_sms
      if response.success
        flash[:success] = "Thank you ol' chap! You'll receive your first recommendation soon..."
      else
        flash[:error] = "#{response.error_code}: #{response.error_description}"
      end
    end
    redirect_to '/'
  end

  private

  def create_params
    params.require(:user).permit(:phone_number)
  end

  def send_sms
    api = Clockwork::API.new('4dbe78968ca4bf59d789acdd1956570c95f64db4')
    message = api.messages.build(to: @user.phone_number, content: sms_body)
    message.deliver
  end

  def sms_body
    name = MovieName.order('RANDOM()').first.name
    summary = MovieSummary.order('RANDOM()').first.summary
    "\"#{name}\" is showing today #{time} at #{cinema}. #{summary}"
  end

  def cinema
    [
      'ODEON Great Northern',
      'Printworks Vue',
      'Lowry Vue',
      'HOME Manchester'
    ].sample
  end

  def time
    "#{rand(10..23)}:#{['00','15','30','45'].sample}"
  end
end
