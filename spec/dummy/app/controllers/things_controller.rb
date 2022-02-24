# frozen_string_literal: true

class ThingsController < ApplicationController
  PAGES = %w[
    javascript_include_tag_page
    stylesheet_link_tag_page
    javascript_pack_tag_page
    stylesheet_pack_tag_page
    javascript_packs_with_chunks_tag_page
    stylesheet_packs_with_chunks_tag_page
    image_tag_page
  ]


  PAGES.each do |page|
    define_method(page) do
      # no-op, will render <page>.html.erb
    end
  end
end
