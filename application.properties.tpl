spring.application.name=gestioBackEnd

server.error.include-message=always
server.error.include-binding-errors=always

spring.datasource.url=jdbc:mysql://localhost:3306/askyu
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
spring.datasource.username=testes
spring.datasource.password=12345678

spring.jpa.show-sql=true
spring.jpa.properties.hibernate.format_sql=true
spring.jpa.hibernate.ddl-auto=update

spring.servlet.multipart.enabled=true
spring.servlet.multipart.max-file-size=10MB
spring.servlet.multipart.max-request-size=10MB
cors.allowed-origins=${ipv4_public}
