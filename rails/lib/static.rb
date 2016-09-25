class Static
  attr_reader :app

  def initialize(app)
    @app = app
  end

  def call(env)
    req = Rack::Request.new(env)
    res = Rack::Response.new

    if /^\/public(\/\w+)*\/\w+(\.jpg$|\.png$|\.zip$|\.txt$)/.match(req.path)
      curr_dir = File.expand_path(File.dirname(__FILE__))
      path_to_asset = "#{curr_dir}/..#{req.path}"

      if File.exists?(path_to_asset)
        file = File.read(path_to_asset)
        #need to build a switch statement
        res['Content-type'] = 'image/png'
        res.write(file)
        res.finish
      else
        res.status = 404
        res.write("File not found")
        res.finish
      end
    else
      app.call(env)
    end
  end
end
