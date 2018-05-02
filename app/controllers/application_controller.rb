class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:home, :about, :contact]
  before_action :only_admin, only: [:delete_chat, :edit_chat, :update_chat]
  def home
  end

  def about
  end

  def contact
  end

  def secret
  end

  # by hanson
  def chats
    if current_user.admin?
      @chats = Chat.all
    else
      @chats = Chat.where([ "sender_id = ? or receiver_id = ?", current_user.id, current_user.id ])
    end
  end

  # by hanson
  def chatform
    if params[:chat].present?
      @chat = Chat.create({
        sender_id: current_user.id,
        receiver_id: params[:chat][:receiver_id],
        chat: params[:chat][:chat]
      })
    else
      @chat = Chat.new
    end

    @users = User.where.not(role: :admin)
  end

  # by hanson
  def delete_chat
    @chat = Chat.find(params[:id])
    @chat.destroy if @chat.present?
    redirect_back fallback_location: '/'
  end

  # by hanson
  def edit_chat
    @chat = Chat.find(params[:id])
    @users = User.where.not(role: :admin)
    render 'chatform'
  end

  # by hanson
  def update_chat
    @chat = Chat.find(params[:id])
    @chat.update(params.require('chat').permit(:receiver_id, :chat));
    @users = User.where.not(role: :admin)
    render 'chatform'
  end

  protected

  def only_admin
    render 'not_auth', :status => :unauthorized unless current_user.admin?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end
