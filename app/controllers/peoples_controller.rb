class PeoplesController < ApplicationController

  require ='oauth2';

  CLIENT_ID = '55e461ad4e04f666b9dadb21ccfd07bc77b4075858caa80b54920b3ae171dd38';
  CLIENT_SECRET = '1b5f351806d1a9115693835d0162f03244c36d8c1822aff6cf65d5bc7f1bd36c';
  API_TOKEN = '1ec862aed9724b88c38da24383d501d40b5279b8753089d0f4971a19a476edf6';

  def add



    #this is used to create a person after they have passed validation
    conn = Faraday.new(:url => 'https://vincentinitiativv.nationbuilder.com')

    @re = conn.post do |req|
      req.url '/api/v1/people?access_token=' + API_TOKEN;
      req.headers['Content-Type'] = 'application/json'
      req.body = '{
  "person": {
    "email": "bobble@example.com",
    "last_name": "Newer",
    "first_name": "Person",
    "sex": "M",
    "employer": "forty",
    "party": "P",
    "registered_address": {
      "state": "TX",
      "country_code": "US"
    }
  }
}';
    end










=begin
    conn = Faraday.new(:url => 'https://vincentinitiativv.nationbuilder.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    @b = conn.get '/api/v1/sites/vincentinitiativv/pages/basic_pages', { :limit => 10, :access_token => '1ec862aed9724b88c38da24383d501d40b5279b8753089d0f4971a19a476edf6' }
=end

  end



  def create_person



    #this is used to create a person after they have passed validation
    conn = Faraday.new(:url => 'https://vincentinitiativv.nationbuilder.com')

    @re = conn.post do |req|
      req.url '/api/v1/people?access_token=' + API_TOKEN;
      req.headers['Content-Type'] = 'application/json'
      req.body = '{
                  "person": {
                    "email": "'+params[:email]+'",
                    "last_name": "'+params[:last_name]+'",
                    "first_name": "'+params[:first_name]+'",
                    "sex": "'+params[:gender]+'",
                    "employer": "'+params[:employer]+'",
                    "party": "'+params[:party]+'",
                    "registered_address": {
                      "state": "'+params[:state]+'",
                      "country_code": "'+params[:country_code]+'"
                    }
                  }
                }';
    end

    @status = @re.status;

    #render ajax layout
    render layout: 'ajax';





  end




end