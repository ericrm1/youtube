Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*'  # Permite qualquer origem (use apenas em dev!)
      resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options]
    end
end