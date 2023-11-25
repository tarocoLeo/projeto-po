require "test_helper"

class PaginaWebControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pagina_web_index_url
    assert_response :success
  end
end
