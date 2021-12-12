require 'rails_helper'

RSpec.describe ParticipantsController do
    describe 'GET /index', type: :controller do
        it 'should return all participants data' do
            get :index
            expect(response.status).to eql(200)
        end
    end

    describe 'POST /create' do
        it 'should create a participant' do
            post :create, params: { participant: { name: 'fake_name', dob: '05-05-2021', ab_test_group_id: 1}}
            expect(response.status).to eql(200)
        end
    end

    describe 'PATCH /update' do
        let!(:ab_test_group) { AbTestGroup.create(group_name: 'name') }
        let!(:participant) { Participant.create(name: 'updated_fake_name', ab_test_group_id: ab_test_group.id ) }

        it 'should update a participant' do
            patch :update, params: {
                id: participant.id,
                participant: {
                    name: 'updated_fake_name',
                    ab_test_group_id: ab_test_group.id
                }
            }
            json = JSON.parse(response.body).deep_symbolize_keys
            expect(json[:name]).to eq('updated_fake_name')
            expect(response.status).to eql(200)
        end
    end

    describe 'DELETE /destroy' do
        let!(:ab_test_group) { AbTestGroup.create(group_name: 'name') }
        let!(:participant) { Participant.create(name: 'updated_fake_name', dob: '05-05-2021', ab_test_group_id: ab_test_group.id ) }
        it 'should destroy a participant' do
            delete :destroy, params: {
                id: participant.id,
            }
            expect(response.status).to eql(200)
        end
    end
end