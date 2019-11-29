class Book < ApplicationRecord
    before_save :default_values
    validates :title, presence: true
    validates :author, presence: true

    attr_accessor :image_url

    scope :status, -> (status) { where status: status }

    private
        def default_values
            self.status = 'UNREAD' if self.status.nil?
        end
end
