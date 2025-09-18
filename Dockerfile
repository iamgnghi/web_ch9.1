FROM tomcat:11-jdk21

# Cài ant để build
RUN apt-get update && apt-get install -y ant && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy source code
COPY . .

# Build WAR từ build.xml (target dist)
RUN ant dist

# Xóa app mặc định trong Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR vừa build vào Tomcat
RUN cp dist/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
