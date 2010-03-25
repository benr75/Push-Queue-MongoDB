# Push Queue MongoDB

## Configuration

1. Create your development and production certificates in the Apple Provisioning Portal
2. Export the certs in p12 format
3. Convert the p12 to pem format

    openssl pkcs12 -in DevelopmentPushCert.p12 -out push-development-cert.pem -nodes -clcerts
    
    openssl pkcs12 -in ProductionPushCert.p12 -out push-production-cert.pem -nodes -clcerts

4. Place the .pem files in RAILS_ROOT/config/push_certs

## Usage

Creating push messages for the queue:

    PushMessage.create(:token => "DEVICE TOKEN", :badge => 1, :sound => "", :message => "Test Push")

Sending pushes:

    ./script/runner ./lib/push.rb

