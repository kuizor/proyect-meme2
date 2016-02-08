require 'json'
require 'net/http'
#require 'rmega'
require 'rest-client'

module ServiceRequest
	extend ActiveSupport::Concerns
	
	def meme_serv(texto1,texto2,id)
		@json_request = {
		  src_image_id: id,#'Dv99KQ'
		  private: false,
		  captions_attributes: [
		    {
		      text: texto1,
		      top_left_x_pct: 0.05,
		      top_left_y_pct: 0,
		      width_pct: 0.9,
		      height_pct: 0.25
		    },
		    {
		      text: texto2,
		      top_left_x_pct: 0.05,
		      top_left_y_pct: 0.75,
		      width_pct: 0.9,
		      height_pct: 0.25
		    }
		  ]
		}
		conect
	end
	private
	def conect

		create_uri = URI('http://memecaptain.com/gend_images')	#crea el URL
		create_request = Net::HTTP::Post.new(create_uri)		#crea el Request
		create_request['Accept'] = 'application/json'			#
		create_request['Content-Type'] = 'application/json'
		create_request.body = @json_request.to_json

		Net::HTTP.start(create_uri.hostname, create_uri.port) do |http|
		  create_response = http.request(create_request)
		  @link = create_response['Location']
		  #@link = URI(create_response['Location'])
		end
		puts @link
		name = @link.slice(43..50)
		@link << ".jpg"
		sleep 10
		rest = RestClient.get @link
		@comp = name+'.jpg'
		open(@comp, 'wb') do |file|							#Aqui creamos el archivo
			file.write(rest.body)
		end
		#upload
		@link
	end
	def upload
		storage = Rmega.login("kuizor@gmail.com", "miguelhack123")
		storage.root.upload(@comp)
		puts storage.public_url
	end

			#App-key 	ahoc4otwt91anyb
			#App-secret 	ji24wprni9m1zxd

			#token 		dt3Jg8D-FuAAAAAAAAAABuH6p0E6WYDqqiwFs3_bGfkbhUaLlIOclGlvWAXMfOo5
	#def dropbox
	#	APP_KEY = 'ahoc4otwt91anyb'
	#	APP_SECRET = 'ji24wprni9m1zxd'

	#	flow = DropboxOAuth2FlowNoRedirect.new(APP_KEY, APP_SECRET)
	#	authorize_url = flow.start()

	#	puts '1. Go to: ' + authorize_url
	#	puts '2. Click "Allow" (you might have to log in first)'
	#	puts '3. Copy the authorization code'
	#	print 'Enter the authorization code here: '
	#	code = gets.strip
		
	#	access_token, user_id = flow.finish(code)
	#end
end