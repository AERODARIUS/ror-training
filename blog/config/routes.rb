# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users do
    resources :articles, :comments
  end

  resources :articles do
    resources :comments
  end

  root 'welcome#index'
end
