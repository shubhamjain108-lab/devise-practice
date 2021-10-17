class Userrequest < ApplicationRecord
  belongs_to :user

  after_initialize do
    if self.new_record?
      self.status ||= :panding
    end
  end
end
