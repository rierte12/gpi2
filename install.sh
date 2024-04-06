git clone https://github.com/sakaiproject/sakai
wget https://github.com/checkstyle/checkstyle/releases/download/checkstyle-10.15.0/checkstyle-10.15.0-all.jar -O checkstyle.jar
cd sakai
wget https://gist.githubusercontent.com/rierte12/6add8174d8f7aa76525cca8bd4404f28/raw/69878eb139e7f23501c3fd7939bff8c75f6ca657/sakai-gpi2.xml -O pom.xml
mvn install
mvn clean test
