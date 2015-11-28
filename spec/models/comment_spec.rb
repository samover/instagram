require 'rails_helper'

describe Comment do
  it { is_expected.to belong_to :post }
  it { is_expected.to belong_to :user }
end
