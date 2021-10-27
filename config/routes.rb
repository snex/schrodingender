Rails.application.routes.draw do
  get ':api_key', to: 'signatures#show'

  root to: 'signatures#show'
end
