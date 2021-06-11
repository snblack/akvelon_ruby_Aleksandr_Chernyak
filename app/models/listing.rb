class Listing < ApplicationRecord
  has_many :docs

  validates :path, :update_time, presence: true

  after_create :create_files
  after_update :create_files

  def create_files
    Rails.cache.fetch "#{self.path}:#{File.mtime(Dir.pwd)}", :expires_in => 12.hours do
      list_files = Dir.entries(self.path).delete_if { |x| x == '.' }
      list_files.delete('..') if self.path == Dir.home

      Dir.chdir(self.path)
      self.docs.delete_all

      list_files.each do |f|
        self.docs.create(
          name: File.basename(f),
          size: File.size(f),
          update_time: File.mtime(f).strftime('%d/%m/%Y %k:%M'),
          path: File.absolute_path(f),
          type_doc: File.ftype(f)
        )
      end
    end
  end
end
