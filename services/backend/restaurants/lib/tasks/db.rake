# frozen_string_literal: true

namespace :db do
  desc 'Executes de db/seed.rb file'
  task seed: :environment do
    `rails runner ./db/seed.rb`
  end
end
