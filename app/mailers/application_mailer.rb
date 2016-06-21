# Базовый класс для всех мэйлеров приложения
class ApplicationMailer < ActionMailer::Base
  # обратный адрес всех писем по умолчанию
  default from: "alezibarev@gmail.com"

  # Задаем макет для всех писем
  layout 'mailer'
end
