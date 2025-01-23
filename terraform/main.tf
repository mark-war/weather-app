terraform {
    backend "gcs" {
        bucket = "devops-directive-argaam"
        prefix = "state/weather-app"
    }
    
}