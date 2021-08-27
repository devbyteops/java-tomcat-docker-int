FROM tomcat:8.0
ADD **/*.war /usr/local/tomcat/webapps/
EXPOSE 8082
CMD ["catalina.sh", "run"]
