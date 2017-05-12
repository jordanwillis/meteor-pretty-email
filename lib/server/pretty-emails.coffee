OriginalHandlebars.registerHelper 'footer', ->
  options = _.extend(@, PrettyEmail.options)
  if options.companyName
    Handlebars.templates.footer(options)

OriginalHandlebars.registerHelper 'eachLine', (content, options) ->
  _.reduce content?.split('\n'), (result, content) ->
    result + options.fn(content)
  , ''

PrettyEmail =
  options: {}
  defaults:
    showFooter: true
    footerTemplate: 'footer'
    showFollowBlock: true
  style:
    fontFamily: 'Helvetica'
    fontColor: '#606060'
    buttonColor: '#FFFFFF'
    buttonBgColor: '#3071a9'

  send: (template, options) ->
    options = _.extend {}, @defaults, @options, options

    Email.send
      from: options.from
      to: options.to
      subject: options.subject,
      html: @render template, options

  render: (template, options) ->
    options.style = @style
    options = _.extend {}, @defaults, @options, options

    if typeof template == 'string'
      template = Handlebars.templates[template]

    if typeof template == 'function'
      template(options)
    else
      throw new Error "PrettyEmail can't render template. Pass template name or handlebars function."
