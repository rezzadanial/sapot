# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  if document.getElementById('gig_location') != null
    destination_location = document.getElementById('gig_location')
    autocomplete = new google.maps.places.Autocomplete(destination_location)
    autocomplete.addListener 'place_changed', ->
      place = autocomplete.getPlace()