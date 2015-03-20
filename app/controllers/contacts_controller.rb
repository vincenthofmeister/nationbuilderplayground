class ContactsController < ApplicationController

  API_TOKEN = '1ec862aed9724b88c38da24383d501d40b5279b8753089d0f4971a19a476edf6';


  def new_contact_point
    #this method receives payload from nationbuilder when contact is made with a person (from webhook)

  end


  def log_contact
    #this is a form that is capable of logging contact with a person, displays payload from above method upon

  end

  def show_logs
    #this shows all of the payloads sent to this contact point sorted by date


  end








end