require './app/models/space.rb'
require './app/models/user.rb'

describe Space do
  let(:user) { User.create(name: 'Allan', email: 'allan@gmail.com', username: 'allan123', password: 123, password_confirmation: 123) }
  let(:subject) { described_class.create(title: "Hog", description: "whatever", price: 10)}

  before do
    user.spaces << subject
    user.save!
  end

  describe '#toggle_availability' do
    it('Changes the availability to false') do
      subject.toggle_availability
      expect(subject.available?).to eq(false)
    end

    it('Changes the availability to true') do
      subject.toggle_availability
      subject.toggle_availability
      expect(subject.available?).to eq(true)
    end
  end
end
