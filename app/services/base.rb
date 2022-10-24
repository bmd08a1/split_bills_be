class ServiceBase
  def success?
    @errors.blank?
  end

  def add_error(error)
    @errors = [] if @errors.nil?

    if error.is_a?(String)
      @errors << StandardError.new(error)
    else
      @errors << error
    end
  end
end
