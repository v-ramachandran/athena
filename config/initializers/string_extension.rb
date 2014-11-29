class String
  def to_bool
    # Note: This is a little different than regular truthyness in Ruby
    # Unless, this is some form of 't', 1, 'true', true , etc this will
    # return false.
    !!ActiveRecord::ConnectionAdapters::Column.value_to_boolean(self)
  end
end
