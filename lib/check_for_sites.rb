#require "check_for_sites/version"
require "net/http"

module CheckForSites
    @lista_sitios = [
        'rubygems.org', 'irstrat.slack.com', 'www.kadokado.com', 'codeanywhere.com',
        'portal.nauta.co.cu', 'otro.server.not', 'translate.google.com', 'www.starbiencuba.com',
        'norepply.com.not', 'rubytutorial.wikidot.com',
    ]
    def self.recorre_lista_servidores
      @lista_sitios.each do |sitio|
        begin
           http = Net::HTTP.new(sitio,80)
           response = http.request_get('/')
           if response.code >= "200" && response.code < "400"
             puts "#{sitio}  is available!"
           end
        rescue SocketError => e
             puts e.message
             puts "|-> Connection could'nt be stablished for website #{sitio}"
        end

      end
    end
end
