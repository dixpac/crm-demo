require "test_helper"

class ContactTest < ActiveSupport::TestCase
  test "requires a first and last name" do
    contact = Contact.new

    assert_not contact.valid?
    assert_includes contact.errors[:first_name], "can't be blank"
    assert_includes contact.errors[:last_name], "can't be blank"
  end

  test "allows a blank email but rejects an invalid one" do
    contact = Contact.new(first_name: "Ada", last_name: "Lovelace")

    assert contact.valid?

    contact.email = "not-an-email"
    assert_not contact.valid?
  end

  test "returns the full name" do
    assert_equal "Ada Lovelace", contacts(:one).full_name
  end
end
