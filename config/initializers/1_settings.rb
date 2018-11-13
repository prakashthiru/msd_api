MsdApi::Settings = HashWithIndifferentAccess.new(Rails.application.config_for(:'msd_api'))

def build_url()
  if ![443, 80].include?(MsdApi::Settings[:port].to_i)
    custom_port = ":#{MsdApi::Settings[:port]}"
  else
    custom_port = nil
  end
  app_path =
  [ MsdApi::Settings[:protocol],
    "://",
    MsdApi::Settings[:host],
    custom_port,
    MsdApi::Settings[:relative_url_root],
  ].join('')
end

MsdApi::Settings[:url] = build_url

MsdApi::Settings[:authentication] ||= HashWithIndifferentAccess.new()
MsdApi::Settings[:authentication][:session_expiration_time] ||= 3600
