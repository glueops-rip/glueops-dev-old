# Test Deployment
FROM httpd:2.4

COPY src/pages/index.tsx /usr/local/apache2/htdocs/src/pages/index.tsx