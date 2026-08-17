require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_url
    assert_response :success
    assert_select "label[for='contact_notes']", text: "Note"
    assert_select "textarea[name='contact[notes]']"
  end

  test "should create contact" do
    description = "Prefers email and is interested in the new product."

    assert_difference("Contact.count") do
      post contacts_url, params: { contact: { address: @contact.address, city: @contact.city, company: @contact.company, country: @contact.country, email: @contact.email, first_name: @contact.first_name, job_title: @contact.job_title, last_name: @contact.last_name, notes: description, phone: @contact.phone, postal_code: @contact.postal_code, state: @contact.state } }
    end

    assert_redirected_to contact_url(Contact.last)
    assert_equal description, Contact.last.notes
  end

  test "should show contact" do
    get contact_url(@contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_contact_url(@contact)
    assert_response :success
    assert_select "textarea[name='contact[notes]']", text: @contact.notes
  end

  test "should update contact" do
    description = "Follow up after the conference."
    patch contact_url(@contact), params: { contact: { address: @contact.address, city: @contact.city, company: @contact.company, country: @contact.country, email: @contact.email, first_name: @contact.first_name, job_title: @contact.job_title, last_name: @contact.last_name, notes: description, phone: @contact.phone, postal_code: @contact.postal_code, state: @contact.state } }
    assert_redirected_to contact_url(@contact)
    assert_equal description, @contact.reload.notes
  end

  test "should destroy contact" do
    assert_difference("Contact.count", -1) do
      delete contact_url(@contact)
    end

    assert_redirected_to contacts_url
  end
end
