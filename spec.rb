# Use TDD principles to build out name functionality for a Person.
# Here are the requirements:
# - Add a method to return the full name as a string. A full name includes
#   first, middle, and last name. If the middle name is missing, there shouldn't
#   have extra spaces.
# - Add a method to return a full name with a middle initial. If the middle name
#   is missing, there shouldn't be extra spaces or a period.
# - Add a method to return all initials. If the middle name is missing, the
#   initials should only have two characters.
#
# We've already sketched out the spec descriptions for the #full_name. Try
# building the specs for that method, watch them fail, then write the code to
# make them pass. Then move on to the other two methods, but this time you'll
# create the descriptions to match the requirements above.


class Person
  def initialize(first_name:, middle_name: nil, last_name:)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  # implement your behavior here
  def full_name
    if @middle_name==nil
      "#{@first_name} #{@last_name}"
    else
    "#{@first_name} #{@middle_name} #{@last_name}"
    end
  end

  def full_name_with_middle_initial
    if @middle_name==nil
      "#{@first_name} #{@last_name}"
    else
      "#{@first_name} #{@middle_name[0]}. #{@last_name}"
    end
  end

  def initials
    if @middle_name==nil
      "#{@first_name[0]}#{@last_name[0]}"
    else
    "#{@first_name[0]}#{@middle_name[0]}#{@last_name[0]}"
    end
  end

end




RSpec.describe Person do
    let(:person_with_middle_name)    { Person.new(first_name: "Rachel", middle_name: "Elizabeth", last_name: "Lum") }
    let(:person_without_middle_name)    { Person.new(first_name: "Rachel", last_name: "Lum") }

    describe "#full_name" do
      it "concatenates first name, middle name, and last name with spaces" do
        expect(person_with_middle_name.full_name).to eq("Rachel Elizabeth Lum")

      end

    it "does not add extra spaces if middle name is missing" do
      expect(person_without_middle_name.full_name).to eq("Rachel Lum")
    end
  end

  describe "#full_name_with_middle_initial" do
    it "concatenates first name, middle initial, and last name with spaces" do
      expect(person_with_middle_name.full_name_with_middle_initial).to eq("Rachel E. Lum")
    end

    it "concatenates first name and last name if middle name is nil" do
      expect(person_without_middle_name.full_name_with_middle_initial).to eq("Rachel Lum")
    end
  end

  describe "#initials" do
    it "concatenates the first letter of the first, middle, and last names of the person" do
      expect(person_with_middle_name.initials).to eq("REL")
    end

    it "concatenates the first letter of the first and last names of the person" do
      expect(person_without_middle_name.initials).to eq("RL")
    end

  end
end
