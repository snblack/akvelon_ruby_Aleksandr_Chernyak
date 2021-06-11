require 'rails_helper'

RSpec.describe Listing, type: :model do
 it { should have_many(:docs) }
 it { should validate_presence_of :path }
 it { should validate_presence_of :update_time }
end
