class MembershipsController < ApplicationController
    def create
        @membership = current_user.memberships.build(:tour_id => params[:tour_id])
        if @membership.save
          flash[:notice] = "You have joined this Tour."
          
        else
          flash[:error] = "Unable to join."
          
        end
      end
    
      def destroy
        @membership = current_user.memberships.find(params[:id])
        @membership.destroy
        flash[:notice] = "Removed membership."
           
      end
end
