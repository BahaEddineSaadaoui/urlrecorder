# Url Recorder [visit](https://url-recorder.herokuapp.com/)

This is a small Ruby On Rails application, that records urls for a precise lap of time.

# How does it work ?

## Home page [view](https://url-recorder.herokuapp.com/)

Given a url, the app parses its content and saves it to a database.
Any attempt to save the same link during the next 5 minutes of the creation time will redirect you to its show page, regarding that it's still valid.

## Listing page [view](https://url-recorder.herokuapp.com/pages)

This page contains a list of all the saved urls, those in green are still valid, and contains a show button that leads to you the show page.
The others in red are expired and inaccessible. 

## Show page , /urls/id

The show page contains the details of the saved url which are:
- the link to the web page
- the page's view in an embedded iframe
