class Place < ActiveRecord::Base
  has_many :addresses, dependent: :destroy
  # reject place if any of the nested fields are empty
  # also allow addresses nested records to be destroyed
  accepts_nested_attributes_for :addresses, allow_destroy: true,
                              reject_if: ->(attrs) { attrs['city'].blank? || attrs['street'].blank? }
end
