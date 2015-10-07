# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
    $('.infinite-table').infinitePages
        debug: true
        buffer: 20 # load new page when within 200px of nav link
        context: ".pagination" # define the scrolling container (defaults to window)
        loading: ->
            # jQuery callback on the nav element
            $(this).text("Loading...")
            console.log('foo')
        success: ->
            # called after successful ajax call
            console.log("successfully made ajax call")
        error: ->
            # called after failed ajax call
            $(this).button("Trouble! Please drink some coconut water and click again")
