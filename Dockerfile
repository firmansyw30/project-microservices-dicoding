# Menggunakan base image 23-alpine yang lebih ringan
FROM node:23-alpine3.20

# Membuat working directory bernama app
WORKDIR /app

# Menyalin package.json dan package-lock.json ke dalam container
COPY package*.json ./

# Menyalin semua file dari direktori lokal ke dalam container
COPY . .

# Menginstall dependencies
RUN npm install

# Menjalankan aplikasi
CMD ["node", "index.js"]

# Expose port 3001
EXPOSE 3001