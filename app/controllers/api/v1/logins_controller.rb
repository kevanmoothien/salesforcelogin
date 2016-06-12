module Api::V1
  class LoginsController < ApiController
    def create
      param = params[:info]
      username = param['username']
      password = param['security']
      host = param['environment'] == 'sandbox' ? 'test.salesforce.com' : 'login.salesforce.com'
      client = Soapforce::Client.new(host: host)
      login = nil

      begin
        login = client.authenticate(username: username, password: password)
        uri = URI(login[:server_url])
        login_url =  "#{uri.scheme}://#{uri.host}/secur/frontdoor.jsp?sid=#{login[:session_id]}"

        render json: {url: login_url, session_id: login[:session_id], status: 200}
      rescue Exception => e
        render json: {error: e.to_hash[:fault][:faultstring], status: 404}
      end
    end
  end
end

