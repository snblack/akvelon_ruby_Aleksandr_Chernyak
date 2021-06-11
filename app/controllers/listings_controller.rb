# frozen_string_literal: true

class ListingsController < ApplicationController
  def show
    current_dir = params[:path].present? ? params[:path] : Dir.home

    if Listing.all.find_by(path: current_dir)
      @listing = Listing.all.find_by(path: current_dir)
      @listing.update(path: current_dir, update_time:File.mtime(current_dir))
    else
      @listing = Listing.create(path: current_dir, update_time:File.mtime(current_dir))
    end
  end
end
