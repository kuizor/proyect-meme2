require 'rest-client'
class EmailsController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, with: :r_not_found
	def index
		e = Email.all
		render json:e
	end

	def create
		e = Email.new(permit_params)
		if e.save
			send_message(params[:email_name],params[:link])
			render json:{message: "EmailSend"}
		else
			render json:{message: "Error", errors: e.errors.full_message}
		end
	end
	private 
	def permit_params
		params.require(:email).permit(:email_name, :link)
	end

	def params_message(error)
		render json: {error: error.message}, status: :bad_request
	end

	def r_not_found(error)
		render json: {error: error.message}, status: :not_found
	end
	def send_message(email,link)
				response = RestClient.post "https://api:key-a636b3cdd3a88d2eab491e7ab242184e"\
				"@api.mailgun.net/v3/sandboxf5a853baca6948beb1c8f8d68e21bc59.mailgun.org/messages",
				:from => "Miguel Brazzoduro <kuizor@gmail.com>",
				:to => "#{email}",
				:subject => "Imagen creada por API-MEME",
				:text => "La direccion del enlace es el siguiente:#{link}"
				#:attachment => File.new(File.join("./",@opc))
		end	
end