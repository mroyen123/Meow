# Guna Node.js v18 berasaskan Debian Bookworm (versi terkini)
FROM node:18-bookworm

# Pasang perpustakaan grafik Linux yang diperlukan oleh canvas
RUN apt-get update && apt-get install -y \
    build-essential \
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libgif-dev \
    librsvg2-dev \
    libpixman-1-dev \
    pkg-config \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set folder kerja
WORKDIR /usr/src/app

# Salin fail package
COPY package*.json ./

# Pasang pakej
RUN npm install --legacy-peer-deps

# Salin keseluruhan kod projek
COPY . .

# Jalankan bot
CMD ["node", "index.js"]
