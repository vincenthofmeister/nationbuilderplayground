class ContactsController < ApplicationController

  API_TOKEN = '1ec862aed9724b88c38da24383d501d40b5279b8753089d0f4971a19a476edf6';

  skip_before_action :verify_authenticity_token


  def new_contact_point
    #this method receives payload from nationbuilder when contact is made with a person (from webhook)

    contact = Contacts.create(payload: request.raw_post);

    contact.save;

    render nothing: true;

  end


  def log_contact
    #this is a form that is capable of logging contact with a person, displays payload from above method upon

    conn = Faraday.new(:url => 'https://vincentinitiativv.nationbuilder.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    @resp = conn.get '/api/v1/people', { :limit => 100, :access_token => API_TOKEN }

    @re = JSON.parse(@resp.body)


  end


  def send_contact
    #this actually sends the contact via POST to nationbuilder via the api
    conn = Faraday.new(:url => 'https://vincentinitiativv.nationbuilder.com')

    @re = conn.post do |req|
      req.url '/api/v1/people/'+params[:contact_id]+'/contacts?access_token=' + API_TOKEN;
      req.headers['Content-Type'] = 'application/json'
      req.body = '{
            "contact": {
                "sender_id": "'+ params[:sender_id] +'",
                "broadcaster_id": "'+ params[:broadcaster_id] +'",
                "status": "'+ params[:contact_status] +'",
                "method": "'+ params[:contact_method] +'",
                "type_id": "'+ params[:contact_type] +'",
                "note": "'+ params[:note] +'"
  }
}';
    end

    @status = @re.status;

    #render ajax layout
    render layout: 'ajax';


  end





  def show_logs
    #this shows all of the payloads sent to this contact point sorted by date


  end








end