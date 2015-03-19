class PeoplesController < ApplicationController

  require ='oauth2';

  CLIENT_ID = '55e461ad4e04f666b9dadb21ccfd07bc77b4075858caa80b54920b3ae171dd38';
  CLIENT_SECRET = '1b5f351806d1a9115693835d0162f03244c36d8c1822aff6cf65d5bc7f1bd36c';


  def add


    site_path = 'https://vincentinitiativv.nationbuilder.com'

    #get the host to determine what redirect_uri should be
    host = request.host;

    if host = 'localhost'
      redirect_url = 'http://localhost:3000/pages/nbcallback';
    else
      redirect_url = 'http://nationbuilderplayground.herokuapp.com/pages/nbcallback';
    end

    @client = OAuth2::Client.new(CLIENT_ID, CLIENT_SECRET, :site => site_path)
    @redirect = @client.auth_code.authorize_url(:redirect_url => redirect_url)


  end



end