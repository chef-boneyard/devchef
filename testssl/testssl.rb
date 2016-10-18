# We pull this in as part of the test to keep up to date automatically
remote_file "/testssl.sh" do
  source "https://raw.githubusercontent.com/drwetter/testssl.sh/master/testssl.sh"
  use_last_modified false # github supports etags
  sensitive true
  mode 0755
end

execute "testssl.sh #{ENV['TARGET']}" do
  command "/testssl.sh --color 0 --warnings off --jsonfile /reports/testssl-report.json --openssl /opt/chefdk/embedded/bin/openssl #{ENV['TARGET']}"
  live_stream true
end

ruby_block "check testssl report" do
  block do
    # The first three all have to do with not doing by-the-book, best-practice
    # PKI-stuff (mostly comes with using our one-off self-signed certs)
    ignores = [
      'issuer',   # self-signed cert
      'crl',      # no CRL (related to self-signed cert)
      'ocsp_uri', # "formally known as the TLS Certificate Status Request extension"
      'hsts',     # we don't support HSTS
    ]

    report = ::Chef::JSONCompat.from_json(::File.read("/reports/testssl-report.json"))
    not_oks = report.select { |entry| (entry["severity"] == "NOT ok") && !ignores.include?(entry['id']) }

    not_oks.each do |nok|
      ::Chef::Log.info "NOT OK: [#{nok["id"]}] #{nok["finding"]}"
    end

    raise RuntimeError, "testssl found something NOT OK" unless not_oks.empty?
  end
end
