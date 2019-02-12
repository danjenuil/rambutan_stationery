class ApplicationController < ActionController::Base
    def hello
        render html: 'Hello Danny!'
    end
end
