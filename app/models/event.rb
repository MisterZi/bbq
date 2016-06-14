class Event < ActiveRecord::Base
  # событие принадлежит юзеру
  belongs_to :user

  # юзера не может не быть
  validates :user, presence: true

  # заголовок должен быть, и не длиннее 255 букв
  validates :title, presence: true, length: {maximum: 255}

  # также у события должны быть место и время проведения
  validates :address, presence: true
  validates :datetime, presence: true
end
