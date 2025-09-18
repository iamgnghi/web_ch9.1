FROM tomcat:11-jdk21

# Xóa app mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR build từ IntelliJ vào ROOT.war
COPY out/artifacts/ch09/ch09.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
