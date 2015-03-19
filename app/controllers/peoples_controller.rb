class PeoplesController < ApplicationController

  require ='oauth2';




  def add

    site_path = 'https://vincentinitiativv.nationbuilder.com'
    redirect_uri = 'http://nationbuilderplayground.herokuapp.com/pages/nbcallback'
    client = OAuth2::Client.new(CLIENT_ID, CLIENT_SECRET, :site => site_path)


  end



end