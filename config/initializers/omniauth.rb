OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '189338697038-1hta85j83cq3eb9825ll54tbgdit9ued.apps.googleusercontent.com', 'y4fDBLZBx0hC7JLFNV8clr33', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end

 require "omnicontacts"
Rails.application.middleware.use OmniContacts::Builder do
  # :max_results => 1000
   importer :gmail,'2206940545-vvu4rkbfstgpnkeo41asmoiivq8me8u1.apps.googleusercontent.com', 'ry49-nqn4vJpOMIxDZl3zmNf',  {:redirect_path =>"/employees/gmail/contact_callback", :ssl_ca_file => "/etc/ssl/certs/curl-ca-bundle.crt"}
end