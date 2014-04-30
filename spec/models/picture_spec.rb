require 'spec_helper'

describe Picture do
  describe "validations" do

    it 'url cannot be empty' do
      picture = Picture.create!(url: "google.com/image.png", description: "awesome pic")

      picture.url = ""

      expect(picture).to_not be_valid

    end

    it 'description is less than or equal to 255 characters' do
      picture = Picture.create!(url: "google.com/image.png", description: "awesome pic")

      picture.description = "7.3 errors.add
The add method lets you manually add messages that are related to particular attributes. You can use the errors.full_messages or errors.to_a methods to view the messages in the form they might be displayed to a user. Those particular messages get the attribute name prepended (and capitalized). add receives the name of the attribute you want to add the message to, and the message itself."

      expect(picture).to_not be_valid
    end

    it 'description cannot be empty' do
      picture = Picture.create!(url: "google.com/image.png", description: "awesome pic")

      picture.description = ""

      expect(picture).to_not be_valid
    end

  end
end