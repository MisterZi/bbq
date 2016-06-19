# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  # Добавляем обработчик, чтобы можно было менять размер аватарок
  # и делать миниатюрные версии
  include CarrierWave::RMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Папка, в которой будут храниться все наши загруженные файлы
  # например, uploas/avatar/avatat/1
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Аватарку, загруженную пользователем, надо обрезать/уменьшить
  # так, чтобы получился квадрат 400x400
  process resize_to_fill: [400, 400]

  # А потом нужно сделать миниатюрную версию 100x100
  version :thumb do
    process :resize_to_fit => [100, 100]
  end

  # Мы разрешаем для загрузки только файлы с расширением картинок
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
