<!DOCTYPE html>
<html>
<head>
  <title>API Docs</title>
  <link rel="icon" type="image/png" href="/favicon-swagger.png">
  <link rel="stylesheet" href="{{ asset('css/swagger-ui.css') }}" />
</head>
<body>
  <div id="swagger-ui"></div>

  <script src="{{ asset('js/swagger-ui-bundle.js') }}"></script>
  <script>
    SwaggerUIBundle({
      url: '/swagger/openapi.json',

      dom_id: '#swagger-ui',

      withCredentials: true,

      requestInterceptor: function(request) {
        let match = document.cookie.match(/XSRF-TOKEN=(?<token>[^;]+)/)
        if (match)
          request.headers['X-XSRF-TOKEN'] = decodeURIComponent(match.groups.token);


        request.headers['Referer'] = 'http://localhost:8001/';
        // request.headers['Origin'] = 'http://localhost:8001';
        // request.headers['Host'] = 'localhost:8001';

        return request;
      },
    });
  </script>

  <style>
    section.models {
       display: none !important;
    }
  </style>
</body>
</html>
