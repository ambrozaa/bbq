module ApplicationHelper
  # Возвращает путь к аватарке данного юзера. Если у пользователя есть его
  # личная, возвращает её, иначе стандартную.
  def user_avatar(user)
    if user.avatar?
      user.avatar.url
    else
      asset_path('user.png')
    end
  end

  # Аналогично user_avatar, только возвращает миниатюрную версию
  # Аналогично user_avatar, только возвращает миниатюрную версию
  def user_avatar_thumb(user)
    if user.avatar.file.present?
      user.avatar.thumb.url
    else
      asset_path('user.png')
    end
  end

  # Возвращает адерс рандомной фотки события, если есть хотя бы одна. Или ссылку
  # на дефолтную картинку.
  def event_photo(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.url
    else
      asset_path('event.jpg')
    end
  end

  # Аналогично event_photo, только возвращает миниатюрную версию
  def event_thumb(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.thumb.url
    else
      asset_path('event_thumb.jpg')
    end
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "bi bi-#{icon_class}"
  end
end
