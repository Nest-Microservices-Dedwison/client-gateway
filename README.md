## Cliente Gateway
El Gateway es el punto de comunicación entre nuestros clientes y nuestros servicios. Es el encargado de recibir peticiones, enviarlas a los serviios correspondientes y devolver la respuesta al cliente.

## Dev

1. Clonar el repositorio
2. Instalar las dependencias
3. Crear un archivo `.env` basdo en el `.env.template`
4. Levantar un servidor NATS
```
docker run -d --name nats-server -p 4222:4222 -p 8222:8222 nats
```
5. Tener levanatdo los microservicios que se van a consumir
6. Levantar proyecto con `npm run start:dev`

## Prod
Ejecutar
```
docker build -f dockerfile.prod -t client-gateway .
```