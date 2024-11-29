FROM python
WORKDIR /home/devops/devops_docker

RUN apt-get update && apt-get install -y curl
RUN apt install -y python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools
RUN apt install -y python3-venv
RUN pip install --no-cache-dir flask
RUN mkdir /var/run/sshd
RUN mkdir ~/server_web

EXPOSE 22
EXPOSE 5000

RUN git clone -b dev  https://github.com/Anjalo18/DevOps.git

COPY run_test.sh .
RUN chmod +x run_test.sh

CMD ["sh", "-c", "./run_test.sh"]
