module ApplicationHelper
  def t_label(key)
    I18n.t "views.#{key}"
  end

  def translate_enum(object, attribute)
    if object.public_send(attribute).present?
      I18n.t("activerecord.attributes.#{object.class.to_s.underscore}.#{attribute.to_s.pluralize}.#{object.public_send(attribute)}")
    end
  end
end
