module Api::V1
  class LoginsController < ApiController
    def create
      puts "######### #{params[:info]}"
      param = params[:info]
      username = param['username']
      password = param['security']
      host = param['environment'] == 'sandbox' ? 'test.salesforce.com' : 'login.salesforce.com'

      client = Soapforce::Client.new(host: host)

      login = nil

      puts "usernname #{username}"
      puts "password #{password}"
      puts "host #{host}"

      begin
        login = client.authenticate(username: username, password: password)
        uri = URI(login[:server_url])
        login_url =  "#{uri.scheme}://#{uri.host}/secur/frontdoor.jsp?sid=#{login[:session_id]}"

        render json: {url: login_url, status: 200}
      rescue Exception => e
        puts "############ #{e.inspect}"
        render json: {error: e.to_hash, status: 404}
      end
    end
  end
end

