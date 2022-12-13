#!/bin/bash

echo "Criando as imagens..."

docker build -t sgazevedo/projeto-backend:1.0 backend/.
docker build -t sgazevedo/projeto-database:1.0 backend/.

echo "Realizando o push das imagens..."

docker push sgazevedo/projeto-backend:1.0
docker push sgazevedo/projeto-database:1.0

echo "Criando os serviços no cluster kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments no cluster kubernetes..."

kubectl apply -f ./deployment.yml