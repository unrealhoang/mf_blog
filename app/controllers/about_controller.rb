class AboutController < ApplicationController
  def show
    @about_us = StaticPage.where(:name => "about_us").first
  end
end
