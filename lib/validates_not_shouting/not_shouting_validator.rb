# this is not namespaced so that we can do
#   validates :body, not_shouting: true
class NotShoutingValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return true if value.blank?

    if shouting?(value)
      record.errors[attribute] << options.fetch(:message, "cannot be mostly caps. It's not polite to shout.")
    end
  end

  def shouting?(value)
    threshold = options.fetch(:threshold, 0.5)
    (value.gsub(/[^A-Z]/, '').length.to_f / value.length) > threshold
  end
end