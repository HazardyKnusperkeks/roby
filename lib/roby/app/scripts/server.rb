require File.join(File.dirname(__FILE__), '..', 'load')
require File.join(File.dirname(__FILE__), '..', 'run')

app = Roby.app
app.setup
begin
    app.start_server

    Roby::Log::Server.info "server ready"
    sleep
rescue Interrupt
ensure
    Roby::Log::Server.info "server quitting"
    app.stop_server
end
Roby::Log::Server.info "server quit"
