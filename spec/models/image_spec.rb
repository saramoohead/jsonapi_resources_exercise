require 'spec_helper'
require 'shoulda/matchers'

describe Image do

    it { should have_one(:caption) }

end
