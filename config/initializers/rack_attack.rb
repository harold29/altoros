class Rack::Attack
  throttle('limit logins per email', limit: 100, period: 86400) do |req|
    req.params['api_key']
  end

  throttle('limit logins per email', limit: 1, period: 10) do |req|
    req.params['api_key']
  end
end
