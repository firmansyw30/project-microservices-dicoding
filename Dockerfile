# Menggunakan node versi 14
FROM node:14

# Membuat direktori /app sebagai tempat kerja
WORKDIR /app

# Menyalin keseluruhan item ke direktori /app
COPY . .

# Menggunakan env production dan host db
ENV NODE_ENV=production DB_HOST=item-db

# Menjalankan perintah npm install dan npm run build
RUN npm install --production --unsafe-perm && npm run build

# Membuka port 8080
EXPOSE 8080

# Menjalankan perintah npm start
CMD ["npm", "start"]