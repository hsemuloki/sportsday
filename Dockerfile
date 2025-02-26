# Use official Tomcat image
FROM tomcat:9.0

# Set working directory to Tomcat webapps
WORKDIR /usr/local/tomcat/webapps/

# Copy WAR file from the correct location
COPY sports_day.war ROOT.war

# Expose Tomcat default port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
