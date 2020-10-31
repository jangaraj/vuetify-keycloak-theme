docker rm -f keycloak

docker container run -d --name keycloak \
  -p 8080:8080 \
  -p 443:8443 \
  --mount type=bind,source=$PWD/theme,target=/opt/jboss/keycloak/themes/vuetify \
  -e KEYCLOAK_USER=admin \
  -e KEYCLOAK_PASSWORD=secret \
  jboss/keycloak-theme-developer:latest

#docker run -d --name keycloak \
#  -p 10001:8080 \
#  -v $PWD/:/vuetify-keycloak-theme \
#  -e KEYCLOAK_USER=admin \
#  -e KEYCLOAK_PASSWORD=secret \
#  jboss/keycloak:11.0.2

# docker cp keycloak:/opt/jboss/keycloak/themes/keycloak ./theme
# docker cp keycloak:/opt/jboss/keycloak/standalone/configuration/standalone-ha.xml .
