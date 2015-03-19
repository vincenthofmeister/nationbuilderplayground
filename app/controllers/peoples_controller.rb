class PeoplesController < ApplicationController

  require ='oauth2';

  CLIENT_ID = '55e461ad4e04f666b9dadb21ccfd07bc77b4075858caa80b54920b3ae171dd38';
  CLIENT_SECRET = '1b5f351806d1a9115693835d0162f03244c36d8c1822aff6cf65d5bc7f1bd36c';
  API_TOKEN = '1ec862aed9724b88c38da24383d501d40b5279b8753089d0f4971a19a476edf6';

  def add
    #displays add form for person
  end

  def update

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