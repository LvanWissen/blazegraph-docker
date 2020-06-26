FROM tomcat
LABEL MAINTAINER l.vanwissen@uva.nl

RUN rm -rf /usr/local/tomcat/webapps/ROOT
RUN wget -O /usr/local/tomcat/webapps/ROOT.war https://github.com/blazegraph/database/releases/download/BLAZEGRAPH_2_1_6_RC/blazegraph.war

# Enable CORS
RUN sed -i '\:</web-app>:i\
<filter>\n\
    <filter-name>CorsFilter</filter-name>\n\
    <filter-class>org.apache.catalina.filters.CorsFilter</filter-class>\n\
    <init-param>\n\
        <param-name>cors.allowed.origins</param-name>\n\
        <param-value>*</param-value>\n\
    </init-param>\n\
    <init-param>\n\
        <param-name>cors.allowed.methods</param-name>\n\
        <param-value>GET,POST,PUT,HEAD,OPTIONS</param-value>\n\
    </init-param>\n\
    <init-param>\n\
        <param-name>cors.allowed.headers</param-name>\n\
        <param-value>Content-Type,X-Requested-With,Accept,Authorization,Origin,Access-Control-Request-Method,Access-Control-Request-Headers</param-value>\n\
    </init-param>\n\
    <init-param>\n\
        <param-name>cors.exposed.headers</param-name>\n\
        <param-value>Access-Control-Allow-Origin,Access-Control-Allow-Credentials</param-value>\n\
    </init-param>\n\
</filter>\n\
<filter-mapping>\n\
    <filter-name>CorsFilter</filter-name>\n\
    <url-pattern>/*</url-pattern>\n\
</filter-mapping>' $CATALINA_HOME/conf/web.xml

CMD ["catalina.sh", "run"]
