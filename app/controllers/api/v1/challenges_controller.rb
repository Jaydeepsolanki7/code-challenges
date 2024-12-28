class Api::V1::ChallengesController < ApplicationController
  def index
		challenges = Challenge.all
		render json: challenges
	end

	def create
		challenge = Challenge.new(challenge_params)
		if challenge.save
			render json: challenge
		else
			render json: {error: "Challenge not created"}
		end
	end

	def show
		challenge = Challenge.find(params[:id])
		render json: challenge
	end

	def destroy
		challenge = Challenge.find(params[:id])
		challenge.destroy
		render json: {message: "Successfully deleted #{challenge.title}"}
	end

	private

	def challenge_params
		params.require(:challenge).permit(:title, :description, :start_date, :end_date)
	end
end
