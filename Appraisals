case(RUBY_VERSION)

  when '2.6.3' then
    appraise "ruby-#{RUBY_VERSION}_sprockets_3.7.2" do
      gem 'sprockets', '3.7.2'
    end
  else
    raise "Unsupported Ruby version #{RUBY_VERSION}"
end
