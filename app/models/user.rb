# Модель Пользователя
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # юзер может создавать много событий и комментариев
  has_many :events
  has_many :comments
  has_many :subscriptions

  # имя юзера должно быть, и не длиннее 35 букв
  validates :name, presence: true, length: {maximum: 35}

  # при создании нового юзера (create), перед валидацией объекта выполнить метод set_name
  before_validation :set_name, on: :create

  after_commit :link_subscriptions, on: :create

  # Добавляем аплоадер аватарок, чтобы заработал carrierwave
  mount_uploader :avatar, AvatarUploader

  private

  def set_name
    self.name = "Товарисч №#{rand(777)}" if self.name.blank?
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email).update_all(user_id: self.id)
  end

end
