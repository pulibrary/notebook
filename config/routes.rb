# frozen_string_literal: true

Rails.application.routes.draw do
  resources :subjects do
    resources :courses do
      resources :notes
      resources :homeworks
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
