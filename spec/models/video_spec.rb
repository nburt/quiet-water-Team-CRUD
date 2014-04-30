require 'spec_helper'

describe Video do
  describe "validations" do
    before do
      @video = Video.create!(url: "https://www.youtube.com/watch?v=VN8ze3S0Uj8", description: "top gun")

    end

    it 'url cannot be empty' do
      @video.url = ""

      expect(@video).to_not be_valid
    end

    it 'description is less than or equal to 255 characters' do
      @video.description = "7.3 errors.add
The add method lets you manually add messages that are related to particular attributes. You can use the errors.full_messages or errors.to_a methods to view the messages in the form they might be displayed to a user. Those particular messages get the attribute name prepended (and capitalized). add receives the name of the attribute you want to add the message to, and the message itself."

      expect(@video).to_not be_valid
    end

    it 'description cannot be empty' do
      @video.description = ""

      expect(@video).to_not be_valid
    end

    it 'must be a valid url' do
      @video.url = "https://www.youtube.com/"

      expect(@video).to_not be_valid
    end
  end
end