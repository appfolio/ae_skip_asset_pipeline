# frozen_string_literal: true

case RUBY_VERSION
when '2.6.9'
  appraise "ruby-#{RUBY_VERSION}-activesupport60" do
    source 'https://rubygems.org' do
      gem 'activesupport', '~> 6.0.0'
    end
  end

  appraise "ruby-#{RUBY_VERSION}-activesupport61" do
    source 'https://rubygems.org' do
      gem 'activesupport', '~> 6.1.0'
    end
  end
when '2.7.5', '3.1.0'
  appraise "ruby-#{RUBY_VERSION}-activesupport60" do
    source 'https://rubygems.org' do
      gem 'activesupport', '~> 6.0.0'
    end
  end

  appraise "ruby-#{RUBY_VERSION}-activesupport61" do
    source 'https://rubygems.org' do
      gem 'activesupport', '~> 6.1.0'
    end
  end

  appraise "ruby-#{RUBY_VERSION}-activesupport70" do
    source 'https://rubygems.org' do
      gem 'activesupport', '~> 7.0.0'
    end
  end
else
  raise "Unsupported Ruby version #{RUBY_VERSION}"
end
