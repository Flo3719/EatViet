class PagesController < ApplicationController
    def about
        @title = "About Us"
        @content = "This is the about page"
    end
    def landing
        @title = "Landingpage"
        @content = "This is the landingpage"
    end
end
