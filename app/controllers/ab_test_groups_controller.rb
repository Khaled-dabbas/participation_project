class AbTestGroupsController < ApplicationController
    before_action :set_ab_test_group, only: %i[ update destroy ]

    def index
        ab_test_groups = AbTestGroup.all
        render json: ab_test_groups, include: [:participants]
    end

    def create
        @ab_test_group = AbTestGroup.create(ab_test_group_params)

        if @ab_test_group.save
            render json: @ab_test_group
        else
            render json: @ab_test_group.errors
        end
    end

    def update
        if @ab_test_group.update(ab_test_group_params)
            render json: @ab_test_group
        else
            render json: @ab_test_group.errors
        end
    end

    def destroy
        begin
            @ab_test_group.destroy
            # Send out 204 no content status
            render json: { success: true, status: 204 }
        rescue ActiveRecord::RecordNotDestroyed => e
            render json: { success: false , message: "Record #{@ab_test_group.id} not destroyed" }
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_ab_test_group
        @ab_test_group = AbTestGroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ab_test_group_params
        params.require(:ab_test_group).permit(:group_name)
    end
end
