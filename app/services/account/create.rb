module Account
  class Create < ServiceBase
    attr_reader :user

    def initialize(email:, password:)
      @email = email.downcase.strip
      @password = password
    end

    def call
      validate_email!
      create_user!
    rescue StandardError => e
      add_error(e)
    end

    private

    def validate_email!
      if User.exists?(email: email)
        raise StandardError.new('Duplicated email')
      end
    end

    def create_user
      @user = User.create!(email: email, password: password)
    end
  end
end
