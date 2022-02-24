# frozen_string_literal: true

Rails.application.routes.draw do
  ThingsController::PAGES.each do |path|
    get "/#{path}", to: "things\##{path}", as: path
  end
end
