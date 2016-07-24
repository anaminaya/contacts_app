class Contact < ActiveRecord::Base
  def friendly_format_date
    updated_at.strftime("%m/%d/%Y")
  end

  def full_name
    full_name = first_name + " " + last_name
  end

  def japan_prefix
    japan_prefix = "+81" + phone_number
  end
end
