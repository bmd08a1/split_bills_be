class Auth::API < Grape::API
  format :json
  prefix :api

  mount Auth::Account
end
