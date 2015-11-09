class Profile < ActiveRecord::Base
  belongs_to :user
  # validates => This method is a shortcut to all default validators
  # and any custom validator classes ending in ‘Validator’
  validates :gender, inclusion: %w(male female)
  # validate => Adds a validation method or block to the class.
  # This is useful when overriding the validate instance method becomes too unwieldy
  # and you’re looking for more descriptive declaration of your validations.
  validate :first_name_or_last_name
  validate :gender_name_check

  def first_name_or_last_name
    # error.add(attribute, message = :invalid, options = {})
    errors.add(:first_name, "should specify a first name or a last name.") if first_name.nil? && last_name.nil?
  end

  def gender_name_check
    errors.add(:first_name, "cannot be a boy named Sue.") if (first_name == 'Sue') && (gender == 'male')
  end

  def self.get_all_profiles(min_year, max_year)
    # class method: self.xxx
    # the parameter inside the where is SQL language
    # also can be where(:birth_year => min_year..max_year)
    # the default of order is ascending. If want descending, use order(id :desc) or order('id DESC')
    Profile.where("birth_year BETWEEN :min_year AND :max_year", min_year: min_year, max_year: max_year).order(:birth_year)
  end

end
