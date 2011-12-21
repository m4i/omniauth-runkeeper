# OmniAuth RunKeeper

This is the OmniAuth strategy for authenticating to RunKeeper. To use it,
you'll need to sign up for an OAuth2 Application ID and Secret on the
[RunKeeper Applications Page](http://runkeeper.com/partner/applications/registerForm).

## Basic Usage

    use OmniAuth::Builder do
      provider :runkeeper, ENV['RUNKEEPER_CLIENT_ID'], ENV['RUNKEEPER_CLIENT_SECRET']
    end

## License

OmniAuth RunKeeper is released under the MIT license.
