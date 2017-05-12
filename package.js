Package.describe({
  name: "yogiben:pretty-email",
  summary: "Send pretty emails",
  version: "0.0.7",
  git: "https://github.com/yogiben/meteor-pretty-email"
});

Package.onUse(function(api) {
  api.versionsFrom('METEOR@1.0');

  api.use('coffeescript');
  api.use('email');
  api.use('underscore');
  api.use('astrocoders:handlebars-server');

  api.addFiles(
    [
      'lib/server/pretty-emails.coffee',
      'lib/templates/shared/footer.handlebars',
      'lib/templates/call-to-action.handlebars',
      'lib/templates/basic.handlebars'
    ],
    'server');

  api.export('PrettyEmail', 'server');
});
