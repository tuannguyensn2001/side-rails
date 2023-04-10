# frozen_string_literal: true

class BaseService
  attr_reader :errors
  def initialize(*args)
    @errors = []
  end

  def add_error(error)
    @errors << error
  end

end
