# frozen_string_literal: true

case RUBY_VERSION
when '2.7.8', '3.1.4', '3.2.2'
  ['~> 6.0.0', '~> 6.1.0', '~> 7.0.0'].each do |rails_version|
    appraise "ruby-#{RUBY_VERSION}-rails#{rails_version.gsub(/[^\d]/,'')}" do
      source 'https://rubygems.org' do
        gem 'actionpack', rails_version
        gem 'railties', rails_version
      end
    end
  end
else
  raise "Unsupported Ruby version #{RUBY_VERSION}"
end
