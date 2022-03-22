# frozen_string_literal: true

class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: 'dhh', password: 'secret', except: %i[index show]
end
