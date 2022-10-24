class Auth::Account < Grape::API
  namespace 'accounts' do
    desc 'Sign up account'
    params do
      requires :email, String
      requires :password, String
    end
    post '/' do

    end
  end
end
