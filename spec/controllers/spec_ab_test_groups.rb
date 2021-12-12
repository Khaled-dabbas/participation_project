require 'rails_helper'

RSpec.describe AbTestGroupsController do

    describe 'GET /index', type: :controller do
        it 'should returns groups data' do
            get :index
            expect(response.status).to eql(200)
        end
    end

    describe 'POST /create' do
        it 'should create a group' do
            post :create, params: { ab_test_group: { group_name: 'fakeGroup'}}
            expect(response.status).to eql(200)
        end
    end

    describe 'PATCH /update' do
        let!(:ab_test_group) { AbTestGroup.create(group_name: 'name') }

        it 'should update a group' do
            patch :update, params: {
                id: ab_test_group.id,
                ab_test_group: {
                    group_name: 'name',
                }
            }
            json = JSON.parse(response.body).deep_symbolize_keys
            expect(json[:group_name]).to eq('name')
            expect(response.status).to eql(200)
        end
    end

    describe 'DELETE /destroy' do
        let!(:ab_test_group) { AbTestGroup.create(group_name: 'name') }
        it 'should destroy a group' do
            delete :destroy, params: {
                id: ab_test_group.id,
            }
            expect(response.status).to eql(200)
        end
    end
end