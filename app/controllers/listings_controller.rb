# frozen_string_literal: true

class ListingsController < ApplicationController
  def show
    current_dir = Dir.home
    current_dir = params[:path] unless params[:path].nil?
    files = get_files(current_dir)
    files.to_json
  end

  private

  def get_files(current_dir)
    list_files = Dir.entries(current_dir).delete_if { |x| x == '.' }
    list_files.delete('..') if current_dir == Dir.home

    Dir.chdir(current_dir)

    @files = []

    list_files.each do |f|
      @files << { name: File.basename(f),
                  size: File.size(f),
                  update_time: File.mtime(f).strftime('%d/%m/%Y %k:%M'),
                  path: File.absolute_path(f),
                  type: File.ftype(f) }
    end
    
    @files
  end
end
