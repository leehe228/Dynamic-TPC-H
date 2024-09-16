# Dockerfile

FROM mysql:latest

# 환경 변수 설정
ENV MYSQL_ROOT_PASSWORD=yourpassword
ENV MYSQL_DATABASE=tpch

# Copy the custom MySQL configuration file to enable local_infile
COPY my.cnf /etc/mysql/conf.d/
RUN chmod 644 /etc/mysql/conf.d/my.cnf

# 초기화 스크립트 복사
COPY schema2.sql /docker-entrypoint-initdb.d/
# COPY load_data.sql /docker-entrypoint-initdb.d/

# TPC-H 데이터 파일 복사
COPY nation.tbl region.tbl customer.tbl orders.tbl lineitem.tbl partsupp.tbl part.tbl supplier.tbl /var/lib/mysql-files/

# 파일 권한 설정
RUN chown -R mysql:mysql /var/lib/mysql-files
