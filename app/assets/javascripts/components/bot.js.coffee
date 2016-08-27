React = require 'react'

@Bot = React.createClass
  getInitialState: ->
    dark: no

  toggleDark: -> @setState dark: !@state.dark

  componentDidMount: ->
    loading = document.getElementById 'loading-cover'
    tl = new TimelineMax()
    tl.add('start')
    tl.to(loading, .3, {top: '100%', borderRadius: '70%', delay: .3}, 'start+.3')
    tl.timeScale(1)

  render: ->
    {div, input} = React.DOM
    div className: "bot-chat-outer #{'dark-theme' unless !@state.dark}",
      div
        className: 'loading-cover'
        id: 'loading-cover'
      div
        className: 'toggle-theme'
        onClick: @toggleDark
        'Dark Theme'
      div className: 'horizontal-center',
        div className: 'chat-container',
          div className: 'conversation',
            React.createElement BotMessage,
              text: 'Welcome to Chat Botler, nice to meet you!'
              pic: @props.chatbot
            React.createElement UserMessage,
              text: "Hey how's it going, Mr. Chat Botler?"
              pic: @props.profile
            React.createElement BotMessage,
              text: 'Well! Always a good day as a bot! What can I help you with?'
              pic: @props.chatbot
            React.createElement UserMessage,
              text: "Book me a room in Marvin for 2pm tomorrow"
              pic: @props.profile
            React.createElement BotMessage,
              text: 'How long would you like to book the room?'
              pic: @props.chatbot
            React.createElement UserMessage,
              text: "1 hour"
              pic: @props.profile
            React.createElement BotMessage,
              text: "I've booked you Marvin for 1 hour at 2pm tomorrow!"
              pic: @props.chatbot
            React.createElement UserMessage,
              text: "Thanks!"
              pic: @props.profile
            React.createElement BotMessage,
              text: "You're welcome"
              pic: @props.chatbot
            React.createElement UserMessage,
              text: "/findthebots"
              pic: @props.profile
            React.createElement BotMessage,
              text: "Question number 1. This famous Rapbot is named after a domesticated animal. He won a grammy in 2014."
              pic: @props.chatbot
            React.createElement UserMessage,
              text: "Snoop Botty Bot?"
              pic: @props.profile
            React.createElement BotMessage,
              text: "Wow! That was great. Do you want to add the bot to your collection?"
              pic: @props.chatbot
            React.createElement UserMessage,
              text: "yes!"
              pic: @props.profile
          div className: 'input',
            input
              type: 'text'
              placeholder: 'Ask Botler...'

module.exports = @Bot

# getInitialState: ->
#   context: {}
#   text: ""
#
# handleSubmit: (e) ->
#   e.preventDefault()
#   $.ajax
#     url: '/chatbot'
#     data: {'query': {'input': {'text': @state.text}}}
#     method: 'POST'
#   .done (response) =>
#     @setState text: ""
#   .fail ->
#     alert 'Error sending message!'
#
# handleChange: (e) -> @setState text: e.target.value
#
# render: ->
#   {div, span, pre, button, input, form} = React.DOM
#   div className: 'chat-container',
#     form
#       id: 'chatbot'
#       onSubmit: @handleSubmit
#       input
#         type: 'text'
#         name: 'botquery'
#         id: 'bot-query'
#         onChange: @handleChange
