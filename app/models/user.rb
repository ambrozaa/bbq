# Модель Пользователя
class User < ActiveRecord::Base

  # юзер может создавать много событий
  has_many :events
  # имя юзера должно быть, и не длиннее 35 букв
  validates :name, presence: true, length: {maximum: 35}
  validates :email, presence: true, length: {maximum: 255}
  validates :email, uniqueness: true
  validates :email, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/

end