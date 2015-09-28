# Passport-Dwolla

[Passport](https://github.com/jaredhanson/passport) strategy for authenticating
with [Dwolla](http://www.dwolla.com/) using the OAuth 2.0 API.

This module lets you authenticate using Dwolla in your Node.js applications.
By plugging into Passport, Dwolla authentication can be easily and
unobtrusively integrated into any application or framework that supports
[Connect](http://www.senchalabs.org/connect/)-style middleware, including
[Express](http://expressjs.com/).

## Install

    $ npm install passport-dwolla

## Usage

#### Configure Strategy

The Dwolla authentication strategy authenticates users using a Dwolla account
and OAuth 2.0 tokens.  The strategy requires a `verify` callback, which accepts
these credentials and calls `done` providing a user, as well as `options`
specifying a client ID, client secret, callback URL, and sandbox boolean.

    passport.use(new DwollaStrategy({
        clientID: DWOLLA_KEY,
        clientSecret: DWOLLA_SECRET,
        callbackURL: "http://127.0.0.1:3000/auth/dwolla/callback",
        sandbox: true
      },
      function(accessToken, refreshToken, profile, done) {
        User.findOrCreate({ dwollaId: profile.id }, function (err, user) {
          return done(err, user);
        });
      }
    ));

#### Authenticate Requests

Use `passport.authenticate()`, specifying the `'dwolla'` strategy, to
authenticate requests.

For example, as route middleware in an [Express](http://expressjs.com/)
application:

    app.get('/auth/dwolla',
      passport.authenticate('dwolla', { scope: 'AccountInfoFull' }));

    app.get('/auth/dwolla/callback', 
      passport.authenticate('dwolla', { failureRedirect: '/login' }),
      function(req, res) {
        // Successful authentication, redirect home.
        res.redirect('/');
      });

## Examples

For a complete, working example, refer to the [login example](https://github.com/jaredhanson/passport-dwolla/tree/master/examples/login).

## Tests

    $ npm install --dev
    $ make test

[![Build Status](https://secure.travis-ci.org/jaredhanson/passport-dwolla.png)](http://travis-ci.org/jaredhanson/passport-dwolla)

## Credits

  - [Jared Hanson](http://github.com/jaredhanson)

## License

[The MIT License](http://opensource.org/licenses/MIT)

Copyright (c) 2011-2013 Jared Hanson <[http://jaredhanson.net/](http://jaredhanson.net/)>
