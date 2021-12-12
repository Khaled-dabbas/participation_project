require "test_helper"

class AbTestGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ab_test_group = ab_test_groups(:one)
  end

  test "Should show all ab test groups" do
    get ab_test_groups_url
    assert_response :success
  end

  test "Should create ab test group" do
    # assert_difference('AbTestGroup.count') do
    #   post ab_test_groups_url, params: { group_name: @ab_test_group.group_name }
    # end
    post ab_test_groups_url, params: { group_name: @ab_test_group.group_name }


    assert_response @ab_test_group
  end
end
