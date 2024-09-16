# Dynamic-TPC-H
Dynamic TPC-H Testbed Environment

### Clone this Repository
**Clone this Reporitory**
```bash
sudo git clone https://github.com/leehe228/Dynamic-TPC-H.git
cd ./Dynamic-TPC-H
```
- Check files "my.cnf", "Dockerfile" and "schema2.sql"
<br>

### 1. Preparing TPC-H Data
**Download TPC-H Data Generation Tool (DBGen)**
```bash
sudo git clone https://github.com/electrum/tpch-dbgen.git
cd tpch-dbgen
```
<br>

**Move Files into DBGen Repository**
```bash
sudo cp -r /path/to/Dynamic-TPC-H/* /path/to/tpch-dbgen/ 
```
<br>

**Build Data Generation Tool (DBGen)**
```bash
sudo make
```
<br>

**Generate TPC-H Data**
```bash
sudo ./dbgen -s 1
```
- The `-s` option determines the data size (scale)
- Create a `.tbl` file in the current directory
<br>

**[!] Docker files can be built directly (2-A) or pulled from Docker Hub (2-B)**
<br>

### 2-A. Build Dockerfile
**Build Dockerfile to Image**
```bash
sudo docker build -t hoeunlee228/tpch-mysql:latest .
```
<br>

### 2-B. Pull Docker Image
**Pull Docker Image**
```bash
sudo docker pull hoeunlee228/tpch-mysql:latest
```
<br>

### 3. Run Docker Image
**Run Image**
```bash
sudo docker run --name tpch-mysql -e MYSQL_ROOT_PASSWORD=yourpassword -d hoeunlee228/tpch-mysql:latest
```
- A docker image name can be "hoeunlee228/tpch-mysql:lastest" if you pulled from docker hub
<br>

**Check Running Docker Image Processes**
```bash
sudo docker ps -all
```
<br>

**Test Tables**
```bash
sudo docker exec -it tpch-mysql mysql -u root -p tpch
```
- enter your password
<br>

**Check Tables and Data**
```sql
mysql> SHOW TABLES;
mysql > SELECT COUNT(*) FROM CUSTOMER;
```
<br>
