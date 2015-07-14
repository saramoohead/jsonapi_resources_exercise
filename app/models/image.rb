class Image < ActiveRecord::Base

  validates :image_url, presence: true
  validate :website_validator
  validates :caption, length: { minimum: 2 }, allow_nil: true

  private

  def website_validator
    errors[:image_url] << I18n.t("activerecord.errors.messages.invalid") unless website_valid?
  end

  def website_valid?
    !!image_url.match(/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-=\?]*)*\/?$/)
  end

end
