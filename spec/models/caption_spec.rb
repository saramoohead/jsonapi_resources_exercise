require 'spec_helper'
require 'shoulda/matchers'

describe Caption do

    it { should belong_to(:image) }

end
