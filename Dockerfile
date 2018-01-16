FROM jenkins/jenkins:2.89.2

# Whether to skip setup wizard
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# Creates username and password specified through environment variables JENKINS_USER_SECRET and JENKINS_PASS_SECRET
COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy

# Installs version specific plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
