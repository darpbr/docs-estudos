#! /bin/bash

echo 'Criando repositórios'

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo 'Diretorios criados com sucesso!'

echo 'criando oso grupos dos usuarios'

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo 'Finalizada a criação dos grupos'

cat /etc/group | grep GRP_ADM 
cat /etc/group | grep GRP_VEN 
cat /etc/group | grep GRP_SEC

echo 'Criando usuarios e ja adicionando aos respectivos grupos'

useradd carlos -c "Carlos da Silva" -m -s /bin/bash -p $(openssl passwd senha) -G GRP_ADM
useradd maria -c "Maria da Silva" -m -s /bin/bash -p $(openssl passwd senha) -G GRP_ADM
useradd joao -c "Joao da Silva" -m -s /bin/bash -p $(openssl passwd senha) -G GRP_ADM

useradd debora -c "Debora Santos" -m -s /bin/bash -p $(openssl passwd senha) -G GRP_VEN
useradd sebastiana -c "Sebastiana Santos" -m -s /bin/bash -p $(openssl passwd senha) -G GRP_VEN
useradd roberto -c "Roberto Santos" -m -s /bin/bash -p $(openssl passwd senha) -G GRP_VEN

useradd josefina -c "Josefina da Silva Santos" -m -s /bin/bash -p $(openssl passwd senha) -G GRP_SEC
useradd amanda -c "Amanda da Silva Santos" -m -s /bin/bash -p $(openssl passwd senha) -G GRP_SEC
useradd rogerio -c "Rogerio da Silva Santos" -m -s /bin/bash -p $(openssl passwd senha) -G GRP_SEC

echo 'Usuarios criados com sucesso! Lembrar de alterar a senha apos o primeiro acesso'

echo 'Ajustando permissões as pastas de arquivos'

chmod 777 /publico
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

echo 'Permissões ajustadas, servidor configurado! Até a próxima!'
