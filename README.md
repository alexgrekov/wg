
# Ansible WireGuard Deployment

##  Описание

Репозиторий для деплоя WireGuard через Ansible.

---

## ⚙️ Подготовка

### 1. Клонирование

```bash
git clone https://github.com/alexgrekov/wg.git
cd wg
```


### 2. Настройка секретов

Создай директорию вне репозитория:

```bash
mkdir -p ../../secrets
```

Добавь файлы:

- `sudo.password` — пароль sudo
- `vault.password` — пароль для ansible-vault

Проверь симлинки:

```bash
ls -l sudo.password vault.password
```

---

### 3. Настройка переменных

Скопируй vault:

```bash
cp host_vars/server.local/vault.yaml.sample host_vars/server.local/vault.yaml
```

Отредактируй:

```bash
vim host_vars/server.local/vars.yaml
vim host_vars/server.local/vault.yaml
```

Где:

- `vars.yaml` — публичные ключи и обычные параметры
- `vault.yaml` — приватные ключи и чувствительные данные

При необходимости зашифруй:

```bash
ansible-vault encrypt --vault-password-file vault.password host_vars/server.local/vault.yaml
```

---

## 🚀 Запуск

```bash
./bin/deploy.sh
```

или

```bash
.venv/bin/ansible-playbook -Dv -e 'ansible_become_pass=$(cat sudo.password)' \  
       --vault-password-file vault.password playbooks/deploy.yaml \  
       --inventory inventory.yaml
```

---

## 🔐 SSH

Используется `ssh.cfg`.

Все параметры подключения (IP, пользователь, ключи) задаются там.

---

## 📁 Структура

```
bin/                # скрипты запуска
host_vars/          # переменные (vars + vault)
playbooks/          # плейбуки и роли
ssh.cfg             # SSH конфигурация
```

---

# Description

Repository for deploying WireGuard using Ansible.

---

## ⚙️ Setup

### 1. Clone

```bash
git clone https://github.com/alexgrekov/wg.git
cd wg
```

---

### 2. Configure secrets

Create external directory:

```bash
mkdir -p ../../secrets
```

Add:

- `sudo.password` — sudo password
- `vault.password` — ansible-vault password

Check symlinks:

```bash
ls -l sudo.password vault.password
```

---

### 3. Configure variables

```bash
cp host_vars/server.local/vault.yaml.sample host_vars/server.local/vault.yaml
```

Edit:

```bash
vim host_vars/server.local/vars.yaml
vim host_vars/server.local/vault.yaml
```

Where:

- `vars.yaml` — public keys and non-sensitive data
- `vault.yaml` — private keys and secrets

Encrypt if needed:

```bash
ansible-vault encrypt --vault-password-file vault.password host_vars/server.local/vault.yaml
```

---

## 🚀 Run

```bash
./bin/deploy.sh
```

or

```bash
.venv/bin/ansible-playbook -Dv -e 'ansible_become_pass=$(cat sudo.password)' \  
       --vault-password-file vault.password playbooks/deploy.yaml \  
       --inventory inventory.yaml
```

---

## 🔐 SSH

Connection is configured via `ssh.cfg`.

All connection parameters (IP, user, keys) are defined there.

---

## 📁 Structure

```
bin/                # helper scripts
host_vars/          # vars + vault
playbooks/          # playbooks and roles
ssh.cfg             # SSH config
```
