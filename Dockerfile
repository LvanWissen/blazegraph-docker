FROM tomcat
LABEL MAINTAINER l.vanwissen@uva.nl

RUN rm -rf /usr/local/tomcat/webapps/ROOT
RUN wget -O /usr/local/tomcat/webapps/ROOT.war https://github.com/blazegraph/database/releases/download/BLAZEGRAPH_2_1_6_RC/blazegraph.war

CMD ["catalina.sh", "run"]
