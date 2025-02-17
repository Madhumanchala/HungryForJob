package com.comunus.hungryForJob.config;



public  class WebClientResponse {
        private final int statusCode;
        private final String body;
        private final String token;
 
		public WebClientResponse(int statusCode, String body, String token) {
			super();
			this.statusCode = statusCode;
			this.body = body;
			this.token = token;
		}

		public int getStatusCode() {
            return statusCode;
        }

        public String getBody() {
            return body;
        }
        
      
		public String getToken() {
			return token;
		}

		

		@Override
		public String toString() {
			return "WebClientResponse [statusCode=" + statusCode + ", body=" + body + ", token=" + token + "]";
		}

		
        
    }