FROM hugomods/hugo:nightly AS build
WORKDIR /var/app/
COPY . .
RUN hugo --minify

FROM nginx:alpine
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=build /var/app/public /usr/share/nginx/html
ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
EXPOSE 80
