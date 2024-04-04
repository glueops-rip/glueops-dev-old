# Test Deployment
FROM httpd:2.4.57@sha256:5201524443f9026753e25540a44495b7f6e6ca706c71208bb3a5f2daac205c31

COPY src/pages/index.tsx /usr/local/apache2/htdocs/src/pages/index.tsx