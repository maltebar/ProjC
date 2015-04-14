require 'reloader/sse'

class BrowserController < ApplicationController
  include ActionController::Live

  def index
    # SSE expects the `text/event-stream` content type
    response.headers['Content-Type'] = 'text/event-stream'

    sse = Reloader::SSE.new(response.stream)
    @assignment = Assignment.find(Assignment.where(active: true))

    unless @assignment.nil?
      begin
        @assignment.on_phase_change do |r|
          sse.write('hello', :event => 'refresh')
        end
           
          
       rescue IOError
         # When the client disconnects, we'll get an IOError on write
       ensure
         sse.close
       end
    end
  end
end