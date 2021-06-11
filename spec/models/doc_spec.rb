require 'rails_helper'

RSpec.describe Doc, type: :model do
  it { should belong_to(:listing) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :size }
  it { should validate_presence_of :update_time }
  it { should validate_presence_of :type_doc }
end
