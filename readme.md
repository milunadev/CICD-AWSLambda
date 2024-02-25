# CI/CD PIPELINE WITH LAMBDA

1. Levantamos una funcion Lambda por consola, CLI o como quieras. Yo lo hice con terraform, si usas los scripts no olvides setear primero tus keys, tu account ID como variable de Terraform y pasarle el ARN del rol que quieres que tenga Lambda.

```bash
export TF_VAR_AWS_ACCOUNT_ID="904569689818"
terraform init
terraform apply
```

2. Creamos un archivo python, segun el handler que definimos, en mi caso es un lambda_function.py con una funcion lambda_handler dentro.

3. Al usar librerias como pandas, crearemos un archivo de requirements.txt para que se instalen en la etapa de build.

4. Creamos un archivo **buildspec.yml** para definir los procesos de building. En este caso tenemos 3 fases:
- Install: Para descargar las librerias.
- Build: Zipear las librerias y el arifact de Lambda.
- Post-build: Subir el artifact a Lambda

