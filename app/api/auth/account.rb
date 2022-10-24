class Auth::Account < Grape::API
  namespace 'accounts' do
    desc 'Sign up account'
    params do
      requires :email, String
      requires :password, String
    end
    post '/' do
      validate_email_format!

      service = ::Account::Create.new(email: params[:email], password: password)
      service.call

      if service.success?
        user = service.user

        status 200
        { user_id: user.id }
      else
        error!({ error_message: service.errors.first.message }, 422)
      end
    end

    helpers do
      def validate_email_format!
        return if URI::MailTo::EMAIL_REGEXP.match?(params[:email].strip)
        error!({ error_message: "Invalid email format" }, 400)
      end
    end
  end
end
