require './app/models/space.rb'

describe Space do
  let(:subject) { described_class.create(title: "Hog", description: "whatever", price: 10)}
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
