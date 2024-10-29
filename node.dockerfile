# Usa la imagen oficial de Ubuntu
FROM ubuntu:latest

# Instala el servicio SSH
RUN apt-get update && apt-get install -y \
    openssh-server \
    && apt-get clean

# Crea la carpeta .ssh para almacenar claves
RUN mkdir -p /root/.ssh

# Ajusta permisos de la carpeta SSH
RUN chmod 700 /root/.ssh

# Habilita y corre el servicio SSH
RUN service ssh start

# Inicia el servicio SSH como proceso principal
CMD ["/usr/sbin/sshd", "-D"]
