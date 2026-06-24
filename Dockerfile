FROM python:3.10-slim

# Eviter les prompts interactifs pendant l'installation
ENV DEBIAN_FRONTEND=noninteractive

# Installation des dépendances systèmes pour l'interface graphique et le streaming web
RUN apt-get update && apt-get install -y \
    python3-tk \
    xvfb \
    x11vnc \
    fluxbox \
    novnc \
    websockify \
    && rm -rf /var/lib/apt/lists/*

# Faire en sorte que vnc.html s'affiche par défaut quand on visite le site
RUN ln -s /usr/share/novnc/vnc.html /usr/share/novnc/index.html

# Créer un dossier de travail
WORKDIR /app

# Copier tout ton code dans le conteneur
COPY . /app

# Créer le script de démarrage qui va tout lancer
RUN echo '#!/bin/bash\n\
export DISPLAY=:0\n\
# Démarrer un écran virtuel invisible\n\
Xvfb :0 -screen 0 1024x768x16 &\n\
sleep 1\n\
# Démarrer un gestionnaire de fenêtres basique\n\
fluxbox &\n\
# Démarrer le serveur VNC sur cet écran\n\
x11vnc -display :0 -nopw -listen localhost -xkb -forever &\n\
# Démarrer le serveur Web (noVNC) qui diffusera le VNC\n\
websockify --web /usr/share/novnc/ ${PORT:-10000} localhost:5900 &\n\
# Lancer TON projet Python\n\
python3 main.py\n\
' > /app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh

# Indiquer au conteneur d'exécuter ce script
CMD ["/app/entrypoint.sh"]
