require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

    test "invalid signup information" do
        get signup_path
        assert_no_difference 'User.count' do
            post users_path, params: { user: { name:  "",
                                            email: "user@invalid",
                                            password:              "foo",
                                            password_confirmation: "bar" } }
        end
    assert_template 'users/new'
    end

    test "valid general member signup information" do
        get signup_path
        assert_difference 'User.count' do
            post users_path, params: { user: { name:  "Example User",
                                            email: "user@example.com",
                                            password:              "foobarlo",
                                            password_confirmation: "foobarlo" },
                                        secret_code: "xnb3gif3kt" }
        end
    follow_redirect!
    
    #assert_template 'users/show'
    #assert is_logged_in?
    end
    
    test "valid officer signup information" do
        get signup_path
        assert_difference 'User.count' do
            post users_path, params: { user: { name:  "Example User",
                                            email: "user@example.com",
                                            password:              "foobarlo",
                                            password_confirmation: "foobarlo" },
                                        secret_code: "6wej5sfh8d" }
        end
    follow_redirect!
    #assert_template 'users/show'
    #assert is_logged_in?
    end
end