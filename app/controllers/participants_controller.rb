require 'pry'

class ParticipantsController < ApplicationController
    before_action :set_participant, only: %i[ update destroy ]

    def index
        participants = Participant.all
        render json: participants
    end

    def create
        @participant = Participant.create(participant_params)
        if @participant.save
            render json: @participant
        else
            render json: @participant.errors
        end
    end

    def update
        if @participant.update(participant_params)
            render json: @participant
        else
            render json: @participant.errors
        end

    end

    def destroy
        if @participant.destroy
            # Send out 204 no content status
            render json: { success: true, status: 204 }
        else
            render json: { success: false }
        end
    end

    def add_by_group_name
        group = AbTestGroup.find_by_group_name(params[:group_name]).first
        @participant = Participant.create(name: params[:name],dob: params[:dob], ab_test_group: group)
        if @participant.save
            render json: @participant
        else
            render json: @participant.errors
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_participant
        @participant = Participant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def participant_params
        params.require(:participant).permit(:name, :dob, :ab_test_group_id)
    end
end
