Rails.application.routes.draw do
  resource :user_session, only: [:new, :create, :destroy]
  resource :account, controller: "users", only: [:show, :edit, :update]

  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :savings
  resources :fixed_expenses
  resources :fixed_incomes
  resources :expenses do
    collection do
      get :stats
    end
  end
  resources :incomes

  root to: "overview#current_month"
  get "month/:date_string", to: "overview#month", as: :month
end
