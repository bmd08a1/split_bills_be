class Auth::Account < Grape::API
  namespace 'accounts' do
    desc 'Sign up account'
    params do
      requires :email, String
      requires :password, String
    end
    post '/' do
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
  end
end
