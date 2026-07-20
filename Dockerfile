
# PROIECT STAGIU SENTINEL - 25 de misiuni CTF pentru laboratorul de SO

FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    openssh-server cron gcc openssl sudo vim less procps \
    net-tools iputils-ping binutils dnsutils \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/sshd /opt/solutions /opt/levels /opt/procs
RUN touch /opt/solutions/passwords.txt && chmod 600 /opt/solutions/passwords.txt

# userul tehnic "student" - doar owner pentru fisierul-tinta din M02
RUN useradd -m -s /bin/bash student && echo "student:$(openssl rand -hex 8)" | chpasswd

# conturile celor 25 de misiuni
RUN useradd -m -s /bin/bash m01 && echo "m01:alex" | chpasswd
RUN for i in $(seq -w 2 25); do useradd -m -s /bin/bash "m${i}"; done

COPY levels/ /opt/levels/
COPY scripts/entrypoint.sh /entrypoint.sh
COPY scripts/test_environment.sh /opt/scripts/test_environment.sh
RUN chmod +x /opt/levels/*/setup.sh /entrypoint.sh /opt/scripts/test_environment.sh

# ruleaza fiecare misiune IN ORDINE (unele depind de userii creati anterior
# si de conturile misiunilor urmatoare deja existente)
RUN /opt/levels/m01/setup.sh
RUN /opt/levels/m02/setup.sh
RUN /opt/levels/m03/setup.sh
RUN /opt/levels/m04/setup.sh
RUN /opt/levels/m05/setup.sh
RUN /opt/levels/m06/setup.sh
RUN /opt/levels/m07/setup.sh
RUN /opt/levels/m08/setup.sh
RUN /opt/levels/m09/setup.sh
RUN /opt/levels/m10/setup.sh
RUN /opt/levels/m11/setup.sh
RUN /opt/levels/m12/setup.sh
RUN /opt/levels/m13/setup.sh
RUN /opt/levels/m14/setup.sh
RUN /opt/levels/m15/setup.sh
RUN /opt/levels/m16/setup.sh
RUN /opt/levels/m17/setup.sh
RUN /opt/levels/m18/setup.sh
RUN /opt/levels/m19/setup.sh
RUN /opt/levels/m20/setup.sh
RUN /opt/levels/m21/setup.sh
RUN /opt/levels/m22/setup.sh
RUN /opt/levels/m23/setup.sh
RUN /opt/levels/m24/setup.sh
RUN /opt/levels/m25/setup.sh

# parolele de login, corespunzatoare exact valorilor generate mai sus
RUN echo "m02:M02-dotless-7f3a" | chpasswd && \
    echo "m03:M03-regex-9c1e######" | chpasswd && \
    echo "m04:A1B2C3D4E5F6" | chpasswd && \
    echo "m05:M05-suid-8a4d" | chpasswd && \
    echo "m06:M06-radar-3e7c" | chpasswd && \
    echo "m07:M07-cron-5f9a" | chpasswd && \
    echo "m08:M08-corridor-1d8b" | chpasswd && \
    echo "m09:M09-flightlog-6c2f" | chpasswd && \
    echo "m10:M10-manifest-4a9e" | chpasswd && \
    echo "m11:M11-tower-7b3d" | chpasswd && \
    echo "m12:M12-blackbox-2f8a" | chpasswd && \
    echo "m13:M13-clock-9d1c" | chpasswd && \
    echo "m14:M14-checkpoint-5e7b" | chpasswd && \
    echo "m15:M15-relay-3a9f" | chpasswd && \
    echo "m16:M16-depot-8c2e" | chpasswd && \
    echo "m17:M17-weather-1f6d" | chpasswd && \
    echo "m18:M18-archive-4b7a" | chpasswd && \
    echo "m19:M19-signal-9e3c" | chpasswd && \
    echo "m20:M20-history-6a1f" | chpasswd && \
    echo "m21:M21-disk-2d8b" | chpasswd && \
    echo "m22:M22-relayfinal-7f4a" | chpasswd && \
    echo "m23:M23-report-3c9e" | chpasswd && \
    echo "m24:M24-audit-8a2f" | chpasswd && \
    echo "m25:anchor-audit-sentinel-final" | chpasswd

RUN sed -i 's/#\?PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/#\?PermitRootLogin .*/PermitRootLogin no/' /etc/ssh/sshd_config

EXPOSE 22
ENTRYPOINT ["/entrypoint.sh"]
