class ApplicationController < ActionController::API

 # Bloqueia a API para receber apenas se no conteudo do HEADER  tiver algo com 'vnd\.api\+json' de acordo com a documentação, se tiver ele continua
 # se não tiver ele vai retornar nada e vai exibir o status 406

  before_action :ensure_json_request

  def ensure_json_request
    return if request.headers["Accept"] =~ /vnd\.api\+json/
    render :nothing => true, :status => 406
  end

end
